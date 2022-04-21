class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]
  
  def index
    @menus = Menu.all
  end

  def show
    @categories = @menu.categories
  end

  def new
    @menu = Menu.new
    @categories = Category.all
  end

  def edit
    @categories = Category.all
  end

  def create
    @menu = Menu.new(menu_params)
    @categories = params[:category_id]

    if @categories.nil?
      redirect_to("/menus/new")
    end
    
    if !@categories.nil? && @menu.save
      @categories.each do |category|
        #Add each categories of new menu to category details
        @category_details = CategoryDetail.new(
          menu_id: @menu.id,
          category_id: category
        )
        @category_details.save
      end
      redirect_to menu_url(@menu)
    end
  end

  def update
    @categories = params[:category_id]
    
    if @menu.update(menu_params)
      redirect_to menu_url(@menu)
    else
      render :edit, status: 422
    end
  end

  def destroy
    CategoryDetail.destroy_by(menu_id: @menu.id)
    @menu.destroy
    redirect_to menus_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def menu_params
      params.permit(:name, :price, :description)
    end
end
