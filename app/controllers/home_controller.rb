class HomeController < ApplicationController

  def index
    @top_prints = Print.order("num_prints desc").limit(5)
    @featured_prints = Print.where("featured" => true).limit(5)
    @top_creators = Creator.order("number_prints desc").limit(5)
  end

end
