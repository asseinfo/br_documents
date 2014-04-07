require_relative "pattern1"

module ValidaDocs
  module IE
    class ES < Pattern1
      private
      def format_ie(number)
        number
      end
    end
  end
end
