module TestersAccounting
  module Repositories
    class CatToyTesting
      include Import[db: 'persistance.db']

      def finished_tests(account_id:)
        db.execute(%{
          SELECT * FROM cat_toy_testings WHERE account_id = ? AND tested = 1
        }, account_id).map { |raw_data| map_raw_result_to_entity(raw_data) }
      end

      private

      def map_raw_result_to_entity(raw_data)
        TestersAccounting::Entities::CatToyTesting.new(raw_data)
      end
    end
  end
end
