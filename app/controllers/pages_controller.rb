class PagesController < ApplicationController
  def home
  end

  def about
    @programmes = Programme.all
  end
end
