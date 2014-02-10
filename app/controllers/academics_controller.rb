class AcademicsController < ApplicationController
    layout "admin"
    
  before_action :set_academic, :only => [:show, :edit, :update, :destroy]
  before_filter :set_tab
  
  def index
    @academics = Academic.all
    @academic = Academic.new
  end

  def edit
    @academics = Academic.all
  end

  def create
    @academic = Academic.new(academic_params)

    respond_to do |format|
      if @academic.save
        format.html { redirect_to academics_path, :notice => 'Academic was successfully created.' }
      else
        format.html { redirect_to academics_path, :error => 'Please give valid year.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @academic.update(academic_params)
        format.html { redirect_to academics_path, :notice => 'Academic was successfully updated.' }
      else
        format.html { redirect_to academics_path, :error => 'Please give valid year.' }
      end
    end
  end

  def destroy
    @academic.destroy
    respond_to do |format|
      format.html { redirect_to academics_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic
      @academic = Academic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_params
      params.require(:academic).permit(:year)
    end
    
    def set_tab
     @tab = "academic"
  end
end
