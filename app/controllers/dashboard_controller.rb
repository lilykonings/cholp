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

  def update
    @updates = Update.where()
  end

  def new_update
    u = Update.create(title: params[:update][:title], link: params[:update][:link])

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

  def featured_prints
    @featured_prints = Print.where(site_featured: true)
  end

  def new_featured
    @p = Print.find_by(id: params[:p][:id])
    @p.site_featured = true
    @p.save()
    redirect_to action: 'featured_prints'
  end

  def remove_featured_print
    @p = Print.find_by(id: params['id'])
    @p.site_featured = false
    @p.save()
    redirect_to action: 'featured_prints'
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end

end
