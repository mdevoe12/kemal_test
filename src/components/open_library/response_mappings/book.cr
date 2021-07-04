module OpenLibrary
  module ResponseMappings
    class Book
      include JSON::Serializable
      property title : String
      property first_publish_year : String | Int32
    end
  end
end
