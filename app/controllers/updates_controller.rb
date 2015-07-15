class UpdatesController < ApplicationController

  def index
    @updates = Update.order("created_at desc")
  end

end
