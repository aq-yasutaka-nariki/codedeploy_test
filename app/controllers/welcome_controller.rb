class WelcomeController < ApplicationController
  def index
    @users = User.all

    if @users.blank? 
      @users << User.create(name: :aqua_ring)
    end
  end
end
