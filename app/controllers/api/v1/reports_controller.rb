class Api::V1::ReportsController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @orders = Order.where(created_at: Date.today.all_day)
    @date = Date.today

    render json: @orders
  end

  def show_by_email
    @indicators = params[:email]
    @orders = Order.where(customer_email: @indicators)
    
    render json: @orders
  end

  def show_by_range_total_price
    @range_total_price_from = params[:range_total_price_from]
    @range_total_price_until = params[:range_total_price_until]
    @indicators = "Rp.#{@range_total_price_from} - Rp.#{@range_total_price_until}"
    @orders = Order.where('total BETWEEN ? AND ?', @range_total_price_from, @range_total_price_until).order(total: :asc)

    render json: @orders
  end

  def show_by_range_date
    @range_date_from = params[:range_date_from]
    @range_date_until = params[:range_date_until]
    @indicators = "#{@range_date_from} - #{@range_date_until}"
    @orders = Order.where('created_at BETWEEN ? AND ?', @range_date_from, @range_date_until).order(created_at: :asc)

    render json: @orders
  end
end
