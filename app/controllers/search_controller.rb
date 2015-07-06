class SearchController < ApplicationController
  def index
    @q = params['q']
  	@prints = Print.where("name ILIKE ?", "%#{params['q']}%")

  	if params['price_from'] and params['price_from'] != ''
  		@prints = @prints.where("price >= ?", "#{params['price_from']}")
  	end
  	if params['price_to'] and params['price_to'] != ''
  		@prints = @prints.where("price <= ?", "#{params['price_to']}")
  	end
  	if params['materials'] and params['materials'] != ''
		for m in params['materials']
  			@prints = @prints.where("materials ilike ?", "%#{m}%")
  		end
  	end
  end

  def people 
    @q = params['q']
    @people = User.where("username ILIKE ?", "%#{params['q']}%")
  end
end
