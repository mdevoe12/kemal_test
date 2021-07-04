require "http/client"
require "json"

module OpenLibrary
  class Searcher
    getter :base_url, :client, :params_class

    def initialize
      @base_url = "https://openlibrary.org/search.json"
      @client = HTTP::Client
      @params_class = URI::Params
    end

    def call(context : String, query : String)
      params = params_class.encode({ context => query })
      request_url = "#{base_url}?#{params}"
      response = client.get(request_url)

      response.body
    end
  end

  class Book
    include JSON::Serializable
    property title : String
  end
end
