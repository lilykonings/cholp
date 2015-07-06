class HomeController < ApplicationController

  def index
    @top_prints = Print.order("num_prints desc").limit(6)
    @featured_prints = Print.where("featured" => true).limit(6)
    @top_creators = Creator.order("number_prints desc").limit(4)
  end

end
