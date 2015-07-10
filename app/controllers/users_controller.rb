class UsersController < ApplicationController

  def show
    @c = Creator.find_by(name: params[:user])
    if not @c
      flash[:alert] = "creator #{params[:user]} unavailable"
      redirect_to controller: 'home', action: 'index'
    end
    if current_user
      @is_self = (params[:user] == current_user.username)
      @subscribed = Subscription.where(sub_by: current_user.id, sub_to: @c.user_id).count > 0
    end
    @c_user = User.find_by(id: @c.user_id)
    @featured_prints = Print.where(creator_id: @c.id, featured: true)
    @top_prints = Print.where(creator_id: @c.id).order("num_prints desc").limit(6)
  end

  def show_all
    @c = Creator.find_by(name: params[:user])
    @prints = Print.where(creator_id: @c.id)
  end

  def unsubscribe
    c = Creator.find_by(name: params[:user])
    sub = Subscription.find_by(sub_by: current_user.id, sub_to: c.user_id)
  sub.destroy
    redirect_to(:back)
  end

  def subscribe
    c = Creator.find_by(name: params[:user])
    Subscription.create(sub_by: current_user.id, sub_to: c.user_id)
    redirect_to :controller => "users", :action => "show", :user => params[:user]
  end
end
