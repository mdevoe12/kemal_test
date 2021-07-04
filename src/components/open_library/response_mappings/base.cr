require "../../open_library/response_mappings/book"

module OpenLibrary
  module ResponseMappings
    class Base
      include JSON::Serializable
      property docs : Array(Book)
    end
  end
end
