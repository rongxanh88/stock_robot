class AuthenticatedController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    if session[:user_id].nil?
      render file: "public/404", layout: false, status: 404
    end
  end
end