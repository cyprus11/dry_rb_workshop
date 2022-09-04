module CatToyTesting
  module Commands
    class SendResult
      include Dry::Monads[:result, :try]
      include Dry::Monads::Do.for(:call)

      include Import[
        cat_toy_testing_repo: 'contexts.cat_toy_testing.repositories.cat_toy_testing'
      ]

      CharacteristicsValidator = Dry::Schema.Params do
        required(:characteristics).array(:array, min_size?: 1) do
          required(:characteristic_type).value(Shop::Types::CharacteristicType)
          required(:value).value(Shop::Types::CharacteristicValue)
          required(:will_recomended).filled(Shop::Types::CharacteristicWillRecomended)
        end
      end

      def call(cat_toy_id:, account_id:, characteristics:)
        characteristics = yield validate_charactartistics(characteristics)
        cat_toy_testing_record = yield find_cat_toy_testing_account(cat_toy_id, account_id)
        cat_toy_testing = yield update_cat_toy_testing(cat_toy_testing_record, characteristics)

        Success(cat_toy_testing: cat_toy_testing)
      end

      private

      def validate_charactartistics(characteristics)
        CharacteristicsValidator.call(characteristics: characteristics).to_monad
          .fmap { |result| result[:characteristics] }
          .or { |result| Failure([:invalid_characteristics, { error_message: result.to_h, original_characteristics: characteristics }]) }
      end

      def find_cat_toy_testing_account(cat_toy_id, account_id)
        Success(cat_toy_id: cat_toy_id, account_id: account_id)
      end

      def update_cat_toy_testing(cat_toy_testing_record, characteristics)
        cat_toy_testing_repo.test_toy(id: cat_toy_testing_record.id, characteristics: characteristics)
      end
    end
  end
end
