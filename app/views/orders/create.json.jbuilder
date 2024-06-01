json.id @order.id
json.date @order.date
json.amount @order.total_amount
json.items @order.order_items do |order_item|
  json.id order_item.item.id
  json.name order_item.item.name
  json.quantity order_item.quantity
  json.price order_item.unit_price
  json.subtotal order_item.quantity * order_item.unit_price
end
