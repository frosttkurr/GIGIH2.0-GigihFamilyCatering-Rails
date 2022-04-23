require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /index" do
    it "returns http success" do
      Order.create(customer_email: "syakurr@generasigigih.com", total: 30000.0, status: "PAID")
      Order.create(customer_email: "frostt@generasigigih.com", total: 30000.0, status: "NEW")
      Order.create(customer_email: "annisa@generasigigih.com", total: 30000.0, status: "NEW")
      get "/reports"
      expect(response).to have_http_status(:success)
    end
  end

end
