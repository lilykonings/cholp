require_dependency "paypal/application_controller"

module Paypal
  class AdaptivePaymentsController < ApplicationController
    include PayPal::SDK::AdaptivePayments

    def ipn_notify
      if PayPal::SDK::Core::API::IPN.valid?(request.raw_post)
        logger.info("IPN message: VERIFIED")
        render :text => "VERIFIED"

        # p = Print.find_by(id: params[:id])
        # creator = Creator.find_by(id: p.creator_id)
        # t = Transaction.create(print_id: p.id, seller_id: creator.id)

        # if current_user
        #   t.update(buyer_id: current_user.id)
        # end
      else
        logger.info("IPN message: INVALID")
        render :text => "INVALID"
        redirect_to "/", alert: "Something went wrong. Please contact support."
      end
    end

    def cancel_preapproval
      @cancel_preapproval = api.build_cancel_preapproval(params[:CancelPreapprovalRequest] || default_api_value)
      @cancel_preapproval_response = api.cancel_preapproval(@cancel_preapproval) if request.post?
    end

    def confirm_preapproval
      @confirm_preapproval = api.build_confirm_preapproval(params[:ConfirmPreapprovalRequest] || default_api_value)
      @confirm_preapproval_response = api.confirm_preapproval(@confirm_preapproval) if request.post?
    end

    def convert_currency
      @convert_currency = api.build_convert_currency(params[:ConvertCurrencyRequest] || default_api_value)
      @convert_currency_response = api.convert_currency(@convert_currency) if request.post?
    end

    def execute_payment
      @execute_payment = api.build_execute_payment(params[:ExecutePaymentRequest] || default_api_value)
      @execute_payment_response = api.execute_payment(@execute_payment) if request.post?
    end

    def get_allowed_funding_sources
      @get_allowed_funding_sources = api.build_get_allowed_funding_sources(params[:GetAllowedFundingSourcesRequest] || default_api_value)
      @get_allowed_funding_sources_response = api.get_allowed_funding_sources(@get_allowed_funding_sources) if request.post?
    end

    def get_payment_options
      @get_payment_options = api.build_get_payment_options(params[:GetPaymentOptionsRequest] || default_api_value)
      @get_payment_options_response = api.get_payment_options(@get_payment_options) if request.post?
    end

    def payment_details
      @payment_details = api.build_payment_details(params[:PaymentDetailsRequest] || default_api_value)
      @payment_details_response = api.payment_details(@payment_details) if request.post?
    end

    def pay
      p = Print.find_by(id: params[:id])
      creator = Creator.find_by(id: p.creator_id)
      creator_user = User.find_by(id: creator.user_id)
      price = p.price
      commission = 0.02

      PayPal::SDK.configure(
        :mode      => "sandbox",  # Set "live" for production
        :app_id    => "APP-80W284485P519543T",
        :password  => "WX4WTU3S8MY44S7F",
        :signature => "AFcWxV21C7fd0v3bYYYRCpSSRl31A7yDhhsPUU2XhtMoZXsWHFxu-RWy"
      )
      @api = PayPal::SDK::AdaptivePayments.new
      @pay = @api.build_pay({
        :actionType => "PAY",
        :cancelUrl => "http://localhost:3000/p/#{p.id}",
        :returnUrl => "http://localhost:3000/p/#{p.id}",
        :currencyCode => "USD",
        :feesPayer => "PRIMARYRECEIVER",
        :ipnNotificationUrl => "http://localhost:3000/paypal/ipn_notify",
        :receiverList => {
          :receiver => [
            {
              :amount => price * commission,
              :email => "gbd28-facilitator@cornell.edu",
              :primary => false
            },
            {
              :amount => price,
              :email => creator_user.paypal,
              :primary => true
            }
          ]
        },
        :memo => "Cholp transaction for #{p.name}"
      } || default_api_value)
      # @pay.ipnNotificationUrl ||= ipn_notify_url
      # @pay.returnUrl ||= adaptive_payments_url(:pay)
      # @pay.cancelUrl ||= adaptive_payments_url(:pay)
      @pay_response = @api.pay(@pay)

      if @pay_response.success?
        p = Print.find_by(id: params[:id])
        creator = Creator.find_by(id: p.creator_id)
        t = Transaction.create(print_id: p.id, seller_id: creator.id)

        if current_user
          t.update(buyer_id: current_user.id)
        end
        
        # Shouldn't ever come here due to paypal redirect
        redirect_to @api.payment_url(@pay_response)
      else
        @pay_response.error
        redirect_to "/p/#{p.id}", alert: "Something went wrong. Please contact support."
      end
    end

    def preapproval_details
      @preapproval_details = api.build_preapproval_details(params[:PreapprovalDetailsRequest] || default_api_value)
      @preapproval_details_response = api.preapproval_details(@preapproval_details) if request.post?
    end

    def preapproval
      @preapproval = api.build_preapproval(params[:PreapprovalRequest] || default_api_value)
      @preapproval.ipnNotificationUrl ||= ipn_notify_url
      @preapproval.returnUrl ||= adaptive_payments_url(:preapproval)
      @preapproval.cancelUrl ||= adaptive_payments_url(:preapproval)
      @preapproval_response = api.preapproval(@preapproval) if request.post?
    end

    def refund
      @refund = api.build_refund(params[:RefundRequest] || default_api_value)
      @refund_response = api.refund(@refund) if request.post?
    end

    def set_payment_options
      @set_payment_options = api.build_set_payment_options(params[:SetPaymentOptionsRequest] || default_api_value)
      @set_payment_options_response = api.set_payment_options(@set_payment_options) if request.post?
    end

    def get_funding_plans
      @get_funding_plans = api.build_get_funding_plans(params[:GetFundingPlansRequest] || default_api_value)
      @get_funding_plans_response = api.get_funding_plans(@get_funding_plans) if request.post?
    end

    def get_available_shipping_addresses
      @get_available_shipping_addresses = api.build_get_available_shipping_addresses(params[:GetAvailableShippingAddressesRequest] || default_api_value)
      @get_available_shipping_addresses_response = api.get_available_shipping_addresses(@get_available_shipping_addresses) if request.post?
    end

    def get_shipping_addresses
      @get_shipping_addresses = api.build_get_shipping_addresses(params[:GetShippingAddressesRequest] || default_api_value)
      @get_shipping_addresses_response = api.get_shipping_addresses(@get_shipping_addresses) if request.post?
    end

    def get_user_limits
      @get_user_limits = api.build_get_user_limits(params[:GetUserLimitsRequest] || default_api_value)
      @get_user_limits_response = api.get_user_limits(@get_user_limits) if request.post?
    end

    private

    def api
      @api ||= API.new
    end
  end
end

