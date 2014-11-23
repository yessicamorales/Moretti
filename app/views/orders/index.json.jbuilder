json.array!(@orders) do |order|
  json.extract! order, :id, :table
  json.url order_url(order, format: :json)
end
