require 'rails_helper'

RSpec.describe "Menus", type: :request do
  describe "GET /index" do
    it "returns http success" do
      Menu.create(name: "Ayam Goreng", price: 13000.0, description: "Test deskripsi.")
      get menus_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      menu = Menu.create(name: "Ayam Lalapan", price: 18000.0, description: "Test deskripsi")
      get menu_url(menu)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_menu_url
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      menu = Menu.create(name: "Nasi Bakar", price: 9000.0, description: "Test deskripsi")
      get edit_menu_url(menu)
      expect(response).to have_http_status(:success)
    end
  end

end
