class DivisionsController < ApplicationController
layout "admin"
 before_filter :set_tab
  before_filter :set_standard, :only => [:index]
  
 
def index
 @divisions = Division.where(:standard_id => params[:standard_id])
 @division = Division.new
 @division.standard_id = params[:standard_id]
end

def create
  @division = Division.new(division_params)
  if @division.valid?
    @division.save
  end
   redirect_to divisions_path(:standard_id => @division.standard_id)
end



private
  
  def division_params
    params.require(:division).permit(:division_name, :standard_id)
  end


  def set_tab
     @tab = "academic"
  end
  
  def set_standard
    @standard = Standard.find(params[:standard_id])
  end
end
