class HomeController < ApplicationController

  def index
    @top_prints = Print.order("num_prints desc").limit(6)
    @features = Feature.order("created_at desc").limit(5)
    @top_creators = Creator.where("featured" => true).limit(4)
    @updates = Update.order("created_at desc").limit(10)
  end

end
