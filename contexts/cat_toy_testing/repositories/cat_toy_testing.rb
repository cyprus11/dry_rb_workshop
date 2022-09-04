module CatToyTesting
  module Repositories
    class CatToyTesting
      include Import[db: 'persistance.db']

      def find_by_account_and_cat_toy(account_id:, cat_toy_id:)
        db.execute(
          "SELECT * FROM cat_toy_testings where accout_id=? AND cat_toy_id=?", account_id, cat_toy_id
        ).map {|raw_data| map_raw_result_to_entity(raw_data)}
      end

      def find(id:)
        map_raw_result_to_entity(
          db.execute("SELECT * FROM cat_toy_testings WHERE id=?", id).first
        )
      end

      def create(account_id:, cat_toy_id:, tested: 0)
        db.execute(%{
          INSERT INTO cat_toy_testings(account_id, cat_toy_id, tested) VALUES (?, ?, ?) RETURNING id"
        }, account_id, cat_toy_id, tested)
      end

      def test_toy(id:, characteristics:)
        characteristics.each do |characteristic|
          db.execute(%{
            INSERT INTO characteristics(characteristic_type, value, comment, will_recomended, cat_toy_testing_id)
            VALUES (?, ?, ?, ?, ?)
          }, characteristic[:type], characteristic[:value], characteristic[:comment], characteristic[:will_recomended], id)
        end
        set_to_tested(id: id)
        find(id: id)
      end

      def toys_for_test_for_account(account_id:, tested: 0)
        db.execute(%{
          SELECT * FROM cat_toy_testings WHERE account_id = ? AND tested = 0
        }, account_id, tested).map { |raw_data| map_raw_result_to_entity(raw_data) }
      end

      private

      def map_raw_result_to_entity(raw_account)
        CatToyTesting::Entities::CatToyTesting.new(raw_account)
      end

      def set_to_tested(id:)
        db.execute(%{
          UPDATE cat_toy_testings SET tested = 1 WHERE id = ?
        }, id)
      end
    end
  end
end
