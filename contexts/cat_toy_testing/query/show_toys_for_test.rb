module CatToyTesting
  module Queries
    class ShowToysForTest
      include Dry::Monads[:result]

      include Import[
        cat_toy_testing_repo: 'contexts.cat_toy_testing.repositories.cat_toy_testing'
        # account_repo ...
      ]

      def call(account_id:)
        # account = account_repo.find(id: account_id)
        # toys_for_test = cat_toy_testing_repo.toys_for_test_for_account(account_id)

        # if account && toys_for_test
        #   Success(account: account, toys_for_test: toys_for_test)
        # else
        #   Failure(
        #     [
        #       :account_and_toys_not_found,
        #       { account_id: account_id }
        #     ]
        #   )
        # end
      end
    end
  end
end
