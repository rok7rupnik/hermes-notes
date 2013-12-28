json.array!(@strankas) do |stranka|
  json.extract! stranka, :id, :ime, :priimek, :nazivPodjetja, :naslov, :email, :telefon, :davcna, :trr, :ddv, :posta_id
  json.url stranka_url(stranka, format: :json)
end
