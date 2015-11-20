json.array!(@professions) do |profession|
  json.extract! profession, :id
  json.url profession_url(profession, format: :json)
end
