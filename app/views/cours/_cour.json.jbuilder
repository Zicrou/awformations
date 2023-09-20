json.extract! cour, :id, :title, :content, :created_at, :updated_at
json.url cour_url(cour, format: :json)
