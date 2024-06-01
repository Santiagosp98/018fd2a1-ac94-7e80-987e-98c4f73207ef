# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  let(:cart_id) { Digest::UUID.uuid_v4 }
  let(:items) do
    Array.new(3) do
      Fabricate(:item)
    end
  end
  let(:cart) do
    items.map { |item| [item[:id].to_s.to_sym, item[:quantity] - 1] }.to_h
  end
  let(:order) {
    Fabricate(:order)
  }

  before do
    allow(CartManager::CartFetcher).to receive(:call).with(cart_id).and_return(cart)
    allow(ItemManager::ItemsFetcher).to receive(:call).with(items.map(&:id)).and_return(items)
    allow(OrderManager::OrderCreator).to receive(:call).with(cart, items).and_return(order)
  end

  describe 'POST /orders' do
    it 'creates a new order' do
      post orders_url, params: { cart_id: }

      expect(response).to have_http_status(:success)
      expect(response.content_type).to eq('application/json; charset=utf-8')

      json_response = JSON.parse(response.body)
      expect(json_response).to include('id' => order.id)
    end
  end
end
