json.array!(@stroseks) do |strosek|
  json.extract! strosek, :id, :datum, :znesek, :opis, :uporabnik_id
  json.url strosek_url(strosek, format: :json)
end
