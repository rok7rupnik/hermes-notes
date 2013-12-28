json.array!(@storitevs) do |storitev|
  json.extract! storitev, :id, :skupnaKolicina, :cenaNaKos, :opis, :uporabnik_id
  json.url storitev_url(storitev, format: :json)
end
