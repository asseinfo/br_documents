require_relative "pattern2"

module BrDocuments
  module IE
    class PR < Pattern2
      def initialize(number)
        super
        @mask = /^(\d{8}-\d{2})$|^(\d{10})$/
        @weight1 = [3, 2, 7, 6, 5, 4, 3, 2]
        @weight2 = [4, 3, 2, 7, 6, 5, 4, 3, 2]
      end

      private
      def format_ie(number)
        number.sub(/(\d{8})(\d{2})/, "\\1-\\2")
      end
    end
  end
end
