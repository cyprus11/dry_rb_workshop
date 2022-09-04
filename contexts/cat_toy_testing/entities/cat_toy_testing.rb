module CatToyTesting
  module Entities
    class CatToyTesting < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, CatToyTesting::Types::Integer
      attribute :account_id, CatToyTesting::Types::Integer
      attribute :cat_toy_id, CatToyTesting::Types::Integer
      attribute :tested, CatToyTesting::Types::Tested
      attribute :characteristics, Types::Array do
        attribute :characteristic_type, CatToyTesting::Types::CharacteristicType
        attribute :value, CatToyTesting::Types::CharacteristicValue
        attribute :comment, CatToyTesting::Types::String
        attribute :will_recomended, CatToyTesting::Types::CharacteristicWillRecomended
      end
    end
  end
end
