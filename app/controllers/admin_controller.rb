class AdminController < ApplicationController

  #before_filter :authenticate_user!

  layout "admin"

  def index
    @tab = :dashboard
  end
end
