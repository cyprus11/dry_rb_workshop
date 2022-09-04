module TestersAccounting
  module Entities
    class CatToyTesting < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, TestersAccounting::Types::Integer
      attribute :tested, TestersAccounting::Types::Tested
    end
  end
end
