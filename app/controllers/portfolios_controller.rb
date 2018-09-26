class PortfoliosController < ApplicationController

	def new
		# debugger
		@portfolio = Portfolio.new()
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)
		if @portfolio.save
	    	redirect_back(fallback_location: root_path)
	    else
	    	flash[:error] = @portfolio.errors.full_messages
	    	render 'new'
	    end
	end

	def show
		id = params["id"]
		@portfolio = Portfolio.find(id)
	end

	def index
		@portfolios = Portfolio.all
	end

	def edit
		id = params["id"]
		@portfolio = Portfolio.find(id)
	end

	def update_portfolio
		@portfolio=Portfolio.find(params["portfolio"]["id"])
		if @portfolio.update(edit_portfolio_params)
			if params["portfolio"]["photo"].present?
				@portfolio.update_attribute(:photo, params["portfolio"]["photo"])
			else 
				flash[:error] = @portfolio.errors.full_messages
				render 'edit'
			end	
		else
			flash[:error] = @portfolio.errors.full_messages
			render 'edit'		
		end

		redirect_back(fallback_location: root_path)
		
	end
	private
	def portfolio_params
	    params.require(:portfolio).permit(:name,:description,:photo,:area)
	end

	def edit_portfolio_params
	    params.require(:portfolio).permit(:name,:description,:area)
	end

end
