class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to projects_path
    end
  end
end
