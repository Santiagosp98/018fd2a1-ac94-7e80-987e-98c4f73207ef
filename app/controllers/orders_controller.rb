# frozen_string_literal: true

# Defines the methods to manage orders.
class OrdersController < ApplicationController
  before_action :cart, only: [:create]
  before_action :item_ids, only: [:create]

  def create
    items = ItemManager::ItemsFetcher.call(@item_ids)

    @order = OrderManager::OrderCreator.call(@cart, items)

    render :create, formats: :json
  end

  private

  def create_request
    params.permit(:cart_id)
  end

  def cart
    @cart = CartManager::CartFetcher.call(create_request.require(:cart_id))
  end

  def item_ids
    ids = @cart ? @cart.each_key.map { |key| key.to_s.to_i } : []
    @item_ids = ids.reject(&:zero?)
  end
end
