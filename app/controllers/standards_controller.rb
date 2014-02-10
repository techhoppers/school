class StandardsController < ApplicationController

layout "admin"
before_filter :set_academic, :only => [:index]
before_filter :set_tab

def index
 @standards = Standard.where(:academic_id => params[:academic_id])
 @standard = Standard.new
 @standard.academic_id = params[:academic_id]
end

def create
  @standard = Standard.new(standard_params)
  if @standard.valid?
    @standard.save
  end
   redirect_to standards_path(:academic_id => @standard.academic_id)
end



private
  
  def standard_params
    params.require(:standard).permit(:standard_name, :academic_id)
  end

  def set_academic
    @academic = Academic.find(params[:academic_id])
  end
  
  def set_tab
    @tab = "academic"
  end
end
