json.extract! workout, :id, :title, :description, :created_at, :updated_at
json.url workout_url(workout, format: :json)