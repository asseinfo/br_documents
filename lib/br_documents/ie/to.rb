require_relative "pattern1"

module BrDocuments
  module IE
    class TO < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{2}\.\d{2}\.\d{6}\-\d{1})$|^(\d{11})$/
        @weight = [9, 8, 0, 0, 7, 6, 5, 4, 3, 2]
      end

      private
      def format_ie(number)
        number
      end
    end
  end
end
