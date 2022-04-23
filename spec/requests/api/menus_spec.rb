require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create(:menu, name: "Nasi Ayam")
      FactoryBot.create(:menu, name: "Nasi Kebuli")
      get '/api/v1/menus'
    end
    
    it 'returns all menus' do
      expect(json.size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:menu) { 
      FactoryBot.create(:menu) 
    }

    before do
      get "/api/v1/menus/#{menu.id}"
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      before do
        post '/api/v1/menus', params: 
        { 
          name: "Nasi Goreng",
          price: 10000,
          description: "Test deskripsi",
          category_id: [1,2]
        }
      end
            
      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/menus', params:
        { 
          menu: { 
            name: "",
            price: 0,
            description: "Test deskripsi",
            category_id: nil
          } 
        }
      end

      it 'returns to display error' do
        expect(response).to have_http_status(422)
      end
    end
  end
  
  describe "DELETE /destroy" do
    let!(:menu) { 
      FactoryBot.create(:menu) 
    }

    before do
      delete "/api/v1/menus/#{menu.id}"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end