json.array!(@postavkas) do |postavka|
  json.extract! postavka, :id, :zaporednaSt, :kolicina, :popust, :racun_id, :storitev_id
  json.url postavka_url(postavka, format: :json)
end
