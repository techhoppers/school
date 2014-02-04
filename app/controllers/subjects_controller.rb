class SubjectsController < ApplicationController
  layout "admin"
  before_filter :set_tab
  
  def index
    @subjects = Subject.all
  end
  
  private
  
  def set_tab
     @tab = :subject
  end
end
