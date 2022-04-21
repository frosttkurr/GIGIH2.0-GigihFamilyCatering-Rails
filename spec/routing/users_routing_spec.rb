require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/login").to route_to("users#index")
    end

    it "routes to #login" do
      expect(post: "/login").to route_to("users#login")
    end

    it "routes to #logout" do
      expect(post: "/logout").to route_to("users#logout")
    end
  end
end
