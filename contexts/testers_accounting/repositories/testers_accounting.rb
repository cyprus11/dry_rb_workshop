module TestersAccounting
  module Repositories
    class TestersAccounting
      include Import[db: 'persistance.db']

      def add_points(account_id:, points: 1000)
        db.execute(%{
          UPDATE testers_accountings SET counter = counter + ? WHERE id = ?
        }, points, account_id)
      end

      private

      def map_raw_result_to_entity(raw_account)
        TestersAccounting::Entities::TestersAccounting.new(raw_account)
      end
    end
  end
end
