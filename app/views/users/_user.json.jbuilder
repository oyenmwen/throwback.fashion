json.extract! user, :id, :first_name, :last_name, :phone_no, :email, :address, :country, :created_at, :updated_at
json.url user_url(user, format: :json)
