json.extract! user, :id, :name, :type, :phone, :created_at, :updated_at
json.url user_url(user, format: :json)
