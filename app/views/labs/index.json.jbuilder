json.array!(@labs) do |lab|
  json.extract! lab, 
  json.url lab_url(lab, format: :json)
end
