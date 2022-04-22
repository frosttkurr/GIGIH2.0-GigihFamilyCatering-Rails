class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user
  
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
    # @order = Order.new(order_params)
    @email = params[:customer_email]
    @menus = params[:menu_id]
    @quantity = params[:quantity].compact_blank
    @total = 0
  
    if !@menus.nil? && !@quantity.empty? && !@email.empty?
      @order = Order.new(
        user_id: 1,
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
        redirect_to order_url(@order)
      end
    else
      redirect_to("/orders/new", status: 302)
    end
  end

  def update    
    if @order.update(order_params)
      flash[:notice] = "Order was successfully updated."
      redirect_to order_url(@order)
    end
  end

  def destroy
    OrderDetail.destroy_by(order_id: @order.id)
    @order.destroy
    redirect_to orders_url
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
