json.array!(@sells) do |sell|
  json.extract! sell, :id, :table, :sell_date, :total, :subtotal
  json.url sell_url(sell, format: :json)
end
