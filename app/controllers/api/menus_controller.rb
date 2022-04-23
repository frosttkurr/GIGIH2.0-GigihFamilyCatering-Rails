class Api::V1::MenusController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_menu, only: %i[ show edit update destroy ]

  def index
    @menus = Menu.all
    render json: @menus
  end

  def show
    @categories = @menu.categories
    render json: @menu, status: 201
  end

  def create
    @menu = Menu.new(menu_params)
    @categories = params[:category_id]
    
    if !@categories.nil? && @menu.save
      @categories.each do |category|
        #Add each categories of new menu to category details
        @category_details = CategoryDetail.new(
          menu_id: @menu.id,
          category_id: category
        )
        @category_details.save
      end

      render json: @menu, status: 201
    else
      render json: @menu.errors, status: 422
    end
  end

  def update    
    if @menu.update(menu_params)
      render json: @menu, status: 201
    else
      render json: @menu.errors, status: 422
    end
  end

  def destroy
    CategoryDetail.destroy_by(menu_id: @menu.id)
    @menu.destroy
    render :json => {:success => true}
  end

  private
    # Use callbacks to share current category between actions for show/update/delete.
    def set_menu
      @menu = Menu.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def menu_params
      params.permit(:name, :price, :description)
    end

end