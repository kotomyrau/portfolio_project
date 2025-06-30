class PagesController < ApplicationController
  def home
    @programmes = Programme.all
  end
end
