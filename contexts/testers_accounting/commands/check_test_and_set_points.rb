module TestersAccounting
  module Commands
    class CheckTestAndSetpoints
      include Dry::Monads[:result, :try]
      include Dry::Monads::Do.for(:call)

      include Import[
        cat_toy_testing_repo: 'contexts.testers_accounting.repositories.cat_toy_testing',
        testers_accounting_repo: 'contexts.testers_accounting.repositories.testers_accounting'
      ]

      def call(account_id:, cat_toy_id:)
        account = yield find_account(account_id)
        cat_toy = yield find_cat_toy(cat_toy_id)
        account = yield check_tests(account, cat_toy)
        testers_accounting = yield add_points_to_tester(account)

        Success(testers_accounting: testers_accounting)
      end

      private

      def find_account(account_id)
        # find account
        Success(account: account_id)
      end

      def find_cat_toy(cat_toy_id)
        # try to find cat_toy
        Success(cat_toy: cat_toy_id)
      end

      def check_tests(account, cat_toy)
        # check if exist finished tests
        Success(account: account)
      end

      def add_points_to_tester(account)
        testers_accounting_repo.add_points(account_id: account.id)
      end
    end
  end
end
