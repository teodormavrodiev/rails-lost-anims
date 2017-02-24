json.extract! lost_animal, :id, :name, :owner, :owner_email, :description, :city_id, :created_at, :updated_at
json.url lost_animal_url(lost_animal, format: :json)
