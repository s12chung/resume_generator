class ResumeController < ApplicationController

  def index
    Resume.load_data
    
    @inline_css = params[:inline_css]
    
    @resume = Resume.find_by_resume_name(params[:resume_name])
    if @resume.nil?
      @inline_css = "1"
      @resume = Resume.last
    end
  end
end
