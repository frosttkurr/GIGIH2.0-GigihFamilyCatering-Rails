class ReportsController < ApplicationController
  def index
    @orders = Order.where(created_at: Date.today.all_day)
    @date = Date.today
  end
end
