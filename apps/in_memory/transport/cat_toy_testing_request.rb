module InMemory
  module Transport
    class CatToyTestingRequest
      include Import['contexts.cat_toy_testing.service']

      def call
        service.call
      end
    end
  end
end
