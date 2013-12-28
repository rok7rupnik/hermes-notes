json.array!(@racuns) do |racun|
  json.extract! racun, :id, :datum, :znesek, :uporabnik_id, :stranka_id
  json.url racun_url(racun, format: :json)
end
