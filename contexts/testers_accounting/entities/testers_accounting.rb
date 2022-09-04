module TestersAccounting
  module Entities
    class TestersAccounting < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, TestersAccounting::Types::Integer
      attribute :cat_toy_testing_id, TestersAccounting::Types::Integer
      attribute :account_id, TestersAccounting::Types::Integer
      attribute :counter, TestersAccounting::Types::Integer
    end
  end
end
