class UsersController < ApplicationController
  def index
    @User = User.all
  end
end
