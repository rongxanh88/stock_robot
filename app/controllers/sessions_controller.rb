class SessionsController < ApplicationController

  def home

  end

  def new
    @user = User.new
  end

  def create
    binding.pry
  end

end
