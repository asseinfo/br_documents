require_relative "pattern1"

module BrDocuments
  module IE
    class AL < Pattern1
      def initialize(number)
        super
        @mask = /(\d{9})$/
      end

      private

      def format_ie(number)
        number
      end
    end
  end
end
