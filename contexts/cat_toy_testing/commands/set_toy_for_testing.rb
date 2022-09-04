module CatToyTesting
  module Commands
    class SetToyForTesting
      include Dry::Monads[:result, :try]
      include Dry::Monads::Do.for(:call)

      include Import[
        cat_toy_testing_repo: 'contexts.cat_toy_testing.repositories.cat_toy_testing'
      ]

      def call(cat_toy_id:, account_id:)
        cat_toy = yield find_toy(cat_toy_id)
        account = yield find_account(account_id)
        cat_toy_testing = yield set_toy_for_testing(cat_toy, account)

        Success(cat_toy_testing: cat_toy_testing)
      end

      private
      # just for test
      def find_toy(cat_toy_id)
        Container.logger.debug("Finding toy: #{cat_toy_id}")
        Success(cat_toy_id)
      end

      def find_account(account_id)
        Container.logger.debug("Finding account: #{account_id}")
        Success(account_id)
      end

      def set_toy_for_testing(cat_toy, account)
        Container.logger.debug("Create cat_toy_testing with")
        cat_toy_testing_repo.create(account_id: 1, cat_toy_id: 1)
      end
    end
  end
end
