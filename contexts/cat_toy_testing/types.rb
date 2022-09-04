module CatToyTesting
  module Types
    include Dry.Types()

    # types for cat_toy_testing
    Tested = Bool.default(false).constructor do |value|
      value == 1 || value == true ? true : false
    end

    # types for characteristics
    CharacteristicHappinesType = Type.Value('happines').default('happines'.freeze)
    CharacteristicPlayfulType = Type.Value('playful').default('playful'.freeze)
    CharacteristicSafetiesType = Type.Value('safeties').default('safeties'.freeze)
    CharacteristicBrightnessType = Type.Value('brightness').default('brightness'.freeze)
    CharacteristicType = (CharacteristicHappinesType || CharacteristicPlayfulType ||
      CharacteristicSafetiesType || CharacteristicBrightnessType)
    CharacteristicValue = String.constrained(size: 8, format: /[a-z0-9]/)
    CharacteristicWillRecomended = Bool.default(true).constructor do |value|
      value == 1 || value == true ? true : false
    end
  end
end
