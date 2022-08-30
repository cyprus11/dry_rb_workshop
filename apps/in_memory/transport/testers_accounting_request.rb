module InMemory
  module Transport
    class TestersAccountingRequest
      include Import['contexts.testers_accounting.service']

      def call
        service.call
      end
    end
  end
end
