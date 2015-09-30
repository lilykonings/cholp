class FeaturedController < ApplicationController
	def index
		if !current_user || current_user.username != "administrator"
			redirect_to :controller => "home", :action => "index"
		end
		@prints = Print.where("featured" => true)

	end
	def add
		if !current_user || current_user.username != "administrator"
			redirect_to :controller => "home", :action => "index"
		end
		@p = Print.find_by(id: params[:id])
		@p.featured = true
		@p.save()
		redirect_to action: 'index'
	end
	def remove
		if !current_user || current_user.username != "administrator"
			redirect_to :controller => "home", :action => "index"
		end
		@p = Print.find_by(id: params[:id])
		@p.featured = false
		@p.save()
		redirect_to action: 'index'
	end
end
