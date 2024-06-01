# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Carts', type: :request do
  let(:cart_id) { Digest::UUID.uuid_v4 }
  let(:cart) { { id: cart_id } }
  let(:item) { Fabricate(:item) }

  before do
    allow(CartManager::CartCreator).to receive(:call).and_return(cart_id)

    allow(CartManager::CartFetcher).to receive(:call).and_return(cart)
    allow(ItemManager::ItemFetcher).to receive(:call).and_return(item)
    allow(CartManager::ItemAdder).to receive(:call)
    allow(CartManager::ItemRemover).to receive(:call)
  end

  describe 'POST /carts' do
    it 'should render generated cart_id' do
      post carts_url

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['cart_id']).to eq(cart_id)
    end
  end

  describe 'POST /carts/:id/items' do
    let(:request_body) { { item_id: item[:id], quantity: item[:quantity] } }

    it 'should render confirmation message' do
      post "#{carts_url}/#{cart_id}/items", params: request_body

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to be_a(String)
    end
  end

  describe 'DELETE /carts/:id/items' do
    let(:request_body) { { item_id: item[:id], quantity: 1 } }

    it 'should render confirmation message' do
      delete "#{carts_url}/#{cart_id}/items", params: request_body

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['message']).to be_a(String)
    end
  end
end
# rubocop:enable Metrics/BlockLength
