json.extract! order, :id, :product_id, :size_id, :user_id, :qty, :created_at, :updated_at
json.url order_url(order, format: :json)
