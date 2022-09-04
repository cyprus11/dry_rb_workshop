module HTTP
  module Actions
    module Queries
      class ShowToysForTest < Hanami::Action
        include Dry::Monads[:result]

        include Import[
          configuration: 'hanami.action.configuration',
          query: 'contexts.cat_toy_testing.queries.show_toys_for_test'
        ]

        def call(res, req)
          result = query.call(
            account_id: req.params[:id]
          )
          case result
          in Success
            res.status = 200
            res.body = result.value!.to_json
          in Failure[_, error_message]
            halt 422, error_message.to_json
          end
        end
      end
    end
  end
end
