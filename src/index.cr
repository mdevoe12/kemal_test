require "kemal"
require "../src/components/open_library/searcher"
require "../src/components/open_library/response_mappings/base"

get "/" do
  { "message": "Hello World!" }.to_json
end

get "/books" do |env|
  results = OpenLibrary::Searcher.new.call(
    context: "title",
    query: env.params.query["name"]
  )
end

get "/authors" do |env|
  results = OpenLibrary::Searcher.new.call(
    context: "author",
    query: env.params.query["name"]
  )
  
  OpenLibrary::ResponseMappings::Base.from_json(results).docs.to_json
end

Kemal.config.port = 3000
Kemal.run