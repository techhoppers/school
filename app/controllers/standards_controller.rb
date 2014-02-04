class StandardsController < ApplicationController

layout "admin"
before_filter :set_tab

def index
 @standards = Standard.all
end

private
  
  def set_tab
    @tab = :standard
  end
end
