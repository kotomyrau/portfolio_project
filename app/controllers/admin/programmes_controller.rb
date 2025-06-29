class Admin::ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
  end

  def create
    @programme = Programme.new(programme_params)
    if @programme.save
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def destroy
    @programme = Programme.find(params[:id])
    if @programme.destroy
      flash[:notice] = "#{@programme.name} has been deleted"
      redirect_to root_path
    else
      redirect_to programme_path(@programme), notice: 'There was a problem, this programme was not deleted!'
    end
  end

  private

  def programme_params
    params.require(:programme).permit(:name, :skill)
  end
end
