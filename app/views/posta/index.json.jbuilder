json.array!(@posta) do |postum|
  json.extract! postum, :id, :postnaSt, :naziv
  json.url postum_url(postum, format: :json)
end
