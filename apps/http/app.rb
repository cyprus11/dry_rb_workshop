require "hanami/api"
require "hanami/middleware/body_parser"
require 'hanami/action'

module HTTP
  class App < Hanami::API
    use Hanami::Middleware::BodyParser, :json

    get '/tester_toys_ins_test/:id', to: Container['http.actions.queries.show_toys_for_test']

    post '/cat_toy/:id/account/:account_id', to: Container['http.actions.commands.set_toy_for_testing']
    put '/account/:account_id/cat_toy/:cat_toy_id', to: Container['http.actions.commands.send_result']
  end
end
