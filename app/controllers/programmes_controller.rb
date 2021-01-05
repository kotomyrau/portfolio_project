class ProgrammesController < ApplicationController
  def new
    @programme = Programme.new
        @user = current_user

  end

  def create
    @programme = Programme.new
    @user = current_user
    if @programme.save
      redirect_to programme_path(@programme)
    else
      render :new
    end
  end

    def show
      @programme = Programme.find(params[:id])
    end
end
