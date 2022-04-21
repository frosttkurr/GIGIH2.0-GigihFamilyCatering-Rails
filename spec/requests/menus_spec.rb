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

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Menu" do
        expect {
          post menus_url, params: { menu: {name: "Nasi Jinggo", price: 5000.0, description: "Test deskripsi"}, categories: {category_id: [1,2]} }
          puts response.body
        }.to change(Menu, :count).by(1)
      end

      it "redirects to the created menu" do
        post menus_url, params: { menu: {name: "Nasi Jinggo", price: 5000.0, description: "Test deskripsi"}, categories: {category_id: [1,2]} }
        puts response.body
        expect(response).to redirect_to(menu_url(Menu.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Menu" do
        expect {
          post menus_url, params: { menu: {name: nil, price: 0, description: nil} }
        }.to change(Menu, :count).by(0)
      end

      it "renders back to the 'new' template" do
        post menus_url, params: { menu: {name: nil, price: 0, description: nil} }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Nasi Ayam Betutu", price: 30000.0, description: "Test deskripsi" }
      }

      it "updates the requested menu" do
        menu = Menu.create(name: "Nasi Jinggo", price: 5000.0, description: "Test deskripsi")
        patch menu_url(menu), params: { menu: new_attributes }
        menu.reload
        expect(flash[:notice]).to match("Menu was successfully updated.")
      end

      it "redirects to the menu" do
        menu = Menu.create(name: "Nasi Jinggo", price: 5000.0, description: "Test deskripsi")
        patch menu_url(menu), params: { menu: new_attributes }
        menu.reload
        expect(response).to redirect_to(menu_url(menu))
      end
    end

    context "with invalid parameters" do
      it "renders back to the 'edit' template" do
        menu = Menu.create(name: "Nasi Jinggo", price: 5000.0, description: "Test deskripsi")
        patch menu_url(menu), params: { menu: {name: nil, price: 0, description: nil} }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested menu" do
      menu = Menu.create(name: "Nasi Ayam Betutu", price: 30000.0, description: "Test deskripsi")
      expect {
        delete menu_url(menu)
      }.to change(Menu, :count).by(-1)
    end

    it "redirects to the menus list" do
      menu = Menu.create(name: "Nasi Ayam Betutu", price: 30000.0, description: "Test deskripsi")
      delete menu_url(menu)
      expect(response).to redirect_to(menus_url)
    end
  end
end
