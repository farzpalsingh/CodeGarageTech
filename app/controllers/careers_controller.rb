class CareersController < ApplicationController

	
	def new
		 @career=Career.new
	end

	def create
		@career = Career.new(career_params)
		if @career.save
        	ResumeToHr.perform_later career_params.as_json,@career.resume_file.path
	    	redirect_back(fallback_location: root_path)
	    else
	    	flash[:error] = @career.errors.full_messages
	    	render 'new'
	    end
	end

	# def index
	# 	debu
	# end

	private
	def career_params
	    params.require(:career).permit(:f_name,:l_name,:email,:phn_number,:job_position,:work_experience,:technologies,:resume_file)
	end

end
