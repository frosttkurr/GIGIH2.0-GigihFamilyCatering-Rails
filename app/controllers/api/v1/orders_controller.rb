class Api::V1::OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_order, only: %i[ show edit update destroy ]
  
  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @menus = @order.menus
    render json: @order, status: 201
  end

  def create
    @email = params[:customer_email]
    @menus = params[:menu_id]
    @quantity = params[:quantity]
    @total = 0
  
    if !@menus.nil? && !@quantity.empty? && !@email.empty?
      @order = Order.new(
        customer_email: @email,
        total: calculate_total_order(@menus, @quantity),
        status: "NEW"
      )

      if @order.save
        @menus.each_with_index do |menu, index|
          @menu_price = Menu.find_by(id: menu).price
          
          OrderDetail.new(
            order_id: @order.id,
            menu_id: menu,
            menu_price: @menu_price,
            quantity: @quantity[index],
            sub_total: @menu_price * @quantity[index].to_f
          ).save
        end
        
        render json: @order, status: 201
      else 
        render json: @order.errors, status: 422
      end
    end
  end

  def update
    if @order.update(order_params)
      render json: @order, status: 201
    end
  end
  
  def destroy
    OrderDetail.destroy_by(order_id: @order.id)
    @order.destroy
    render :json => {:success => true}
  end
  
  private
    # Use callbacks to share current category between actions for show/update/delete.
    def set_order
      @order = Order.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:customer_email, :status)
    end

    # Use to calculate total price of order
    def calculate_total_order(menus, quantities)
      total_order = 0
      
      menus.each_with_index do |menu, index|
        menu_price = Menu.find_by(id: menu).price
        subtotal = menu_price * quantities[index].to_f
        total_order += subtotal
      end
      return total_order
    end
end