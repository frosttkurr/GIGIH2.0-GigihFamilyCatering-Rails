class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]
  
  def index
    @menus = Menu.all
    @categories = CategoryDetail.all
  end

  def show
    @menu
    @categories = @menu.categories
  end

  def new
    @menu = Menu.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @categories = params[:category_id]

    if @menu.save
      @categories.each do |category|
        @category_details = CategoryDetail.new(
          menu_id: @menu.id,
          category_id: category
        )
        @category_details.save
      end
      redirect_to menu_url(@menu)
    end
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
