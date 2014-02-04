class DivisionsController < ApplicationController
layout "admin"
 before_filter :set_tab
 
def index
 @divisions = Division.all
end

private
  
  def set_tab
     @tab = :division
  end
end
