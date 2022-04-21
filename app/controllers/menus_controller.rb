class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
