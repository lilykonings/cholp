class CreatorsController < ApplicationController

  def enable
    c = current_user.creator
    if c
      c.update(active: true)
    else
      current_user.creator = Creator.create(name: current_user.username, active: true)
    end
    redirect_to :controller => 'dashboard', :action => 'edit'
  end

  def disable
    current_user.creator.update(active: false)
    redirect_to :controller => 'dashboard'
  end

end
