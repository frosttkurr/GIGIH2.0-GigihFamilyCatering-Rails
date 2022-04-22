class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  
  def index
    @orders = Order.all
  end

  def show
    @menus = @order.menus
  end

  def new
    @order = Order.new
    @menus = Menu.all
  end

  def edit
  end

  def create
    # @menu = Menu.new(menu_params)
    # @categories = params[:category_id]
    
    # if !@categories.nil? && @menu.save
    #   @categories.each do |category|
    #     #Add each categories of new menu to category details
    #     @category_details = CategoryDetail.new(
    #       menu_id: @menu.id,
    #       category_id: category
    #     )
    #     @category_details.save
    #   end
    #   redirect_to menu_url(@menu)
    # else
    #   @categories.nil?
    #   redirect_to("/menus/new", status: 302)
    # end
  end

  def update    
    if @order.update(order_params)
      flash[:notice] = "Order was successfully updated."
      redirect_to order_url(@order)
    end
  end

  def destroy
    # CategoryDetail.destroy_by(menu_id: @menu.id)
    # @menu.destroy
    # redirect_to menus_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:customer_email, :status)
    end
end
