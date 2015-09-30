class DashboardController < ApplicationController

  include UploadHelper

  def index
  end

  def edit
    c = current_user.creator
    if c
      c.update(active: true)
    else
      current_user.creator = Creator.create(name: current_user.username, active: true)
    end
    @c = current_user.creator
    @u = current_user
    @unfeatured_prints = Print.where(creator_id: @c.id, featured: [false, nil])
    @featured_prints = Print.where(creator_id: @c.id, featured: true)
  end

  def add_feature
    @p = Print.find_by(id: params['new_feature'])
    @p.featured = true
    @p.save()
    redirect_to action: 'edit'
  end
  def remove_feature
    @p = Print.find_by(id: params['id'])
    @p.featured = false
    @p.save()
    redirect_to action: 'edit'
  end

  def upload
    c = current_user.creator
    if c
      c.update(active: true)
    else
      current_user.creator = Creator.create(name: current_user.username, active: true)
    end
    c = current_user.creator
    if c and c.active
      @materials = ['ABS', 'SLS nylon', 'metal']
      @printers = ['MakerBot', 'Cubify', 'XYZprinting', 'HP', 'Ultimaker 2']
    else
      flash[:alert] = 'uploading must be enabled first'
      redirect_to action: 'index'
    end
  end

  def manage
    c = current_user.creator
    if c
      c.update(active: true)
    else
      current_user.creator = Creator.create(name: current_user.username, active: true)
    end
    @prints = Print.where(creator_id: current_user.creator.id)
  end

  def save
    u = current_user
    c = u.creator

    c.update(description: params[:c][:description])
    u.update(email: params[:c][:email])
    u.update(facebook: params[:c][:facebook])
    u.update(twitter: params[:c][:twitter])
    u.update(google_plus: params[:c][:google_plus])

    unless params[:banner].nil?
      path = creator_upload(u.username, 'banner', params[:banner])
      c.update(banner: path)
    end

    unless params[:icon].nil?
      path = creator_upload(u.username, 'icon', params[:icon])
      c.update(icon: path)
    end

    redirect_to action: 'edit'
  end

  def remove_banner
    c = current_user.creator
    c.update(banner: nil)
    redirect_to action: 'edit'
  end

  def remove_icon
    c = current_user.creator
    c.update(icon: nil)
    redirect_to action: 'edit'
  end

  def settings
    @user = current_user
  end

  def settings_save
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "settings"
    end
  end

  def subscriptions
    sub_to = Subscription.where(sub_to: current_user.id)
    @subscribers = []
    for sub in sub_to
      user = User.where(id: sub.sub_by).take
      @subscribers.push(user)
    end

    sub_by = Subscription.where(sub_by: current_user.id)
    @subs = []
    for sub in sub_by
      user = User.where(id: sub.sub_to).take
      @subs.push(user)
    end
  end

  def home_features
    @features = Feature.order("created_at desc")
  end

  def new_home_feature
    f = Feature.create(title: params[:f][:title])
    f.update(tab_title: params[:f][:tab_title])
    f.update(link: params[:f][:link])
    f.update(description: params[:f][:description])

    unless params[:image].nil?
      path = feature_upload(f.id, params[:image])
      f.update(image: path)
    end

    redirect_to action: 'home_features'
  end

  def remove_home_feature
    Feature.find_by(id: params['id']).delete

    redirect_to action: 'home_features'
  end

  def updates
    @updates = Update.order("created_at desc")
  end

  def new_update
    u = Update.create(title: params[:update][:title])

    unless params[:update][:link].blank?
      u.update(link: params[:update][:link])
    else
      u.update(link: "/updates#" + u.id.to_s)
    end

    u.update(description: params[:update][:description])

    redirect_to action: 'updates'
  end

  def remove_update
    Update.find_by(id: params['id']).delete

    redirect_to action: 'updates'
  end

  def top_creators
    @featured_creators = Creator.where(featured: true)
  end

  def new_top_creator
    u = User.find_by(username: params[:c][:username])
    @c = u.creator
    @c.featured = true
    @c.save()
    redirect_to action: 'top_creators'
  end

  def remove_top_creator
    u = User.find_by(id: params['id'])
    @c = u.creator
    @c.featured = false
    @c.save()
    redirect_to action: 'top_creators'
  end

  def sold_prints
    c = current_user.creator
    if !c
      current_user.creator = Creator.create(name: current_user.username, active: true)
    end

    @prints = Print.where(creator_id: c.id).where("price > ?", 0).order("id DESC")

    @prints_sold ||= []
    @print_rev ||= []

    @prints.each do |p|
      count = 0
      transactions = Transaction.where(print_id: p.id)

      transactions.each do |t|
        count += 1
      end

      @prints_sold << count
      @print_rev << (count * p.price)
    end
  end

  def update_paypal
    new_paypal = params[:paypal][:email]
    current_user.update(paypal: new_paypal)
    flash[:notice] = 'updated Paypal account'
    redirect_to action: 'sold_prints'
  end

  def purchased_prints
    @prints ||= []
    @transactions = Transaction.where(buyer_id: current_user.id).order("created_at DESC")

    @transactions.each do |t|
      p = Print.find_by(id: t.print_id)
      @prints << p
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end

end
