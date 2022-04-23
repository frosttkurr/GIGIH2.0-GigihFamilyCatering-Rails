class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @orders = Order.where(created_at: Date.today.all_day)
    @date = Date.today
  end

  def show_by_email
    @indicators = params[:email]
    @orders = Order.where(customer_email: @indicators)
    
    render :show, orders: @orders, email: @indicators
  end

  def show_by_range_total_price
    @range_total_price_from = params[:range_total_price_from]
    @range_total_price_until = params[:range_total_price_until]
    @indicators = "Rp.#{@range_total_price_from} - Rp.#{@range_total_price_until}"
    @orders = Order.where(total: @range_total_price_from..@range_total_price_until).order(total: :asc)

    render :show, orders: @orders, email: @indicators
  end
end
