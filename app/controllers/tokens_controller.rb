class TokensController < ApplicationController
  before_filter :authenticate_user!

  def create
    current_user.reset_authentication_token!
    redirect_to :back
  end

  def check
    head 200
  end
end
