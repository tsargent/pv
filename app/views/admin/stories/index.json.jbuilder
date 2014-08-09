json.array!(@foos) do |foo|
  json.extract! foo, :id, :title
  json.url foo_url(foo, format: :json)
end
