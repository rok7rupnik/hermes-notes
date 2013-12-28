json.array!(@uporabniks) do |uporabnik|
  json.extract! uporabnik, :id, :ime, :priimek, :nazivPodjetja, :naslov, :email, :telefon, :davcna, :trr, :ddv, :geslo, :posta_id
  json.url uporabnik_url(uporabnik, format: :json)
end
