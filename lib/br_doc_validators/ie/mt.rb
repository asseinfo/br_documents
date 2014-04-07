require_relative "pattern1"

module ValidaDocs
  module IE
    class MT < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{10}\-\d{1})$|^(\d{11})$/
        @weight = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      end

      private
      def format_ie(number)
        number.sub(/(\d{10})(\d{1})/, "\\1-\\2")
      end
    end
  end
end
