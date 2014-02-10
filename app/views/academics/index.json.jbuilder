json.array!(@academics) do |academic|
  json.extract! academic, :id
  json.url academic_url(academic, format: :json)
end
