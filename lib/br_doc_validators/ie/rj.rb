require_relative "pattern1"

module ValidaDocs
  module IE
    class RJ < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{2}\.\d{3}\.\d{2}\-\d{1})$|^(\d{8})$/
        @weight = [2, 7, 6, 5, 4, 3, 2]
      end
    end
  end
end