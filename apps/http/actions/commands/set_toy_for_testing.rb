require 'json'
require 'hanami/action'

module HTTP
  module Actions
    module Commands
      class SetToyForTesting < Hanami::Action
        include Dry::Monads[:result]

        include Import[
          configuration: 'hanami.action.configuration',
          command: 'contexts.cat_toy_testing.commands.set_toy_for_testing'
        ]

        def call(req, res)
          result = command.call(
            cat_toy_id: req.params[:id],
            account_id: req.params[:account_id]
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
