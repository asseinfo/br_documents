require_relative "pattern1"

module ValidaDocs
  module IE
    class AL < Pattern1
      def initialize(number)
        super
        @mask = /(\d{9})$/
      end
    end
  end
end
