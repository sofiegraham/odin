class UsersController < ApplicationController

  def index
    @name = "I'm the index"
  end

  def show
    @name ="I'm the show"
  end

  def new
    @name = "I'm the new"
  end

  def edit
    @name = "I'm the edit"
  end

  def create
  end
end
