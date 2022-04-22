require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:order, 10)
      get '/api/v1/orders'
    end
    
    it 'returns all orders' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let!(:order) { 
      FactoryBot.create(:order) 
    }

    before do
      get "/api/v1/orders/#{order.id}"
    end
    
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      before do
        post '/api/v1/orders', params: 
        { 
          menu_id: 1,
          quantity: 2,
          customer_email: "syakurr@generasigigih.com",
          status: "NEW"
        }
      end
      
      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/api/v1/orders', params:
        { 
          order: { 
            menu_id: [1, 2, 3],
            quantity: [2, 2, 1],
            customer_email: nil,
            status: nil
          } 
        }
      end

      it 'returns no content' do
        expect(response).to have_http_status(204)
      end
    end
  end
  
  describe "DELETE /destroy" do
    let!(:order) { 
      FactoryBot.create(:order) 
    }

    before do
      delete "/api/v1/orders/#{order.id}"
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end