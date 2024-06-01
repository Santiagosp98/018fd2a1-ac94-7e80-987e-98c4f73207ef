# frozen_string_literal: true

# Defines the methods to manage a cart.
class CartsController < ApplicationController
  before_action :find_cart, only: %i[add_item delete_item]
  before_action :find_item, only: %i[add_item delete_item]

  def create
    render json: { cart_id: CartManager::CartCreator.call }
  end

  def add_item
    CartManager::ItemAdder.call(@cart[:id], @item, add_item_request.require(:quantity))
    render json: { message: 'Item added.' }
  end

  def delete_item
    CartManager::ItemRemover.call(@cart[:id], @item, add_item_request.require(:quantity))
    render json: { message: 'Item removed.' }
  end

  private

  def add_item_request
    params.permit(:item_id, :quantity)
  end

  def find_cart
    @cart = CartManager::CartFetcher.call(params[:id]);
  end

  def find_item
    @item = ItemManager::ItemFetcher.call(add_item_request.require(:item_id))
  end
end
