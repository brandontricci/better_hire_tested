class WelcomeController < ApplicationController

  def index
    redirect_to positions_path if user_signed_in?
  end
end