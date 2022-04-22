# require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET /index' do
#     before do
#       FactoryBot.create_list(:order, 10)
#       get '/api/v1/orders'
#     end
    
#     it 'returns all orders' do
#       expect(json.size).to eq(10)
#     end

#     it 'returns status code 200' do
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe 'POST /create' do
#     context 'with valid parameters' do
#       let!(:order) { FactoryBot.create(:order) }

#       before do
#         post '/api/v1/orders', 
#         params: { 
#           post: { 
#             order.title, content: my_post.content 
#           } 
#         }
#       end

#       it 'returns the title' do
#         expect(json['title']).to eq(my_post.title)
#       end

#       it 'returns the content' do
#         expect(json['content']).to eq(my_post.content)
#       end

#       it 'returns a created status' do
#         expect(response).to have_http_status(:created)
#       end
#     end

#     context 'with invalid parameters' do
#       before do
#         post '/api/v1/posts', params:
#                           { post: {
#                             title: '',
#                             content: ''
#                           } }
#       end

#       it 'returns a unprocessable entity status' do
#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end
# end
# end