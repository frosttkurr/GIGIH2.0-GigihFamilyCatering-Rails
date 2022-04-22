require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      Order.create(user_id: 1, customer_email: "syakurr@generasigigih.com", total: 30000.0, status: "NEW")
      get orders_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      order = Order.create(user_id: 1, customer_email: "syakurr@generasigigih.com", total: 30000.0, status: "NEW")
      get order_url(order)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_order_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      order = Order.create(user_id: 1, customer_email: "syakurr@generasigigih.com", total: 30000.0, status: "NEW")
      get edit_order_url(order)
      expect(response).to have_http_status(:success)
    end
  end

end
