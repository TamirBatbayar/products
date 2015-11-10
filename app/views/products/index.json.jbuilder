json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :supplier_id, :detail
  json.url product_url(product, format: :json)
end
