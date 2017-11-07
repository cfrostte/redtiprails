json.extract! mensaje, :id, :created_at, :updated_at
json.url mensaje_url(mensaje, format: :json)
