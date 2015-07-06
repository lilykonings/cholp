class PrintsController < ApplicationController

  include UploadHelper

  def show
    @p = Print.find_by(id: params[:id])
    @p.increment!(:num_prints)
    @c = @p.comments
    @creator = Creator.find_by(id: @p.creator_id)
    @recommended = Print.limit(3).where(creator_id: @creator.id).where.not(id: params[:id])
    if not @p
      flash[:alert] = "print #{params[:id]} not found"
      redirect_to controller: 'home', action: 'index'
    end
  end

  def new

    p = upload()
    if p
      current_user.creator.prints << p

      flash[:notice] = 'print uploaded successfully'
      redirect_to :controller => 'dashboard', :action => 'upload'
    else
      flash[:notice] = 'Please fill in all the fields'
      redirect_to(:back)
    end

  end

  def edit
    @p = Print.find_by(id: params[:id])
    @materials = ['ABS', 'SLS nylon', 'metal']
    @printers = ['MakerBot', 'Cubify', 'XYZprinting', 'HP', 'Ultimaker 2']
  end

  def delete
    @p = Print.find_by(id: params[:id])
    @p.destroy
    redirect_to(:back)
  end

  def modify
    p = Print.find_by(id: params[:id])
    success = upload(p)
    if success
      flash[:notice] = 'Changes saved'
      redirect_to :controller => 'dashboard', :action => 'manage'
    else
      flash[:notice] = 'Please fill in all the fields'
      redirect_to :controller => 'prints', :action => 'edit', :id => params[:id]
    end
  end

  def comment
    p = Print.find_by(id: params[:id])
    c = p.comments.create(comment: params[:comment], user_id: current_user.id)
    p.comments << c

    redirect_to :controller => 'prints', :action => 'show', :id => p.id
  end


end
