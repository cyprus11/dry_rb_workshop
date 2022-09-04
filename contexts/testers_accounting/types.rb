module TestersAccounting
  module Types
    include Dry.Types()

    Tested = Bool.default(false).constructor do |value|
      value == 1 || value == true ? true : false
    end
  end
end
