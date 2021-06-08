require_relative 'pattern2'

module BrDocuments
  module IE
    class DF < Pattern2
      def initialize(number)
        super
        @mask = /^(\d{11}\-\d{2})$|^(\d{13})$/
      end

      private

      def format_ie(number)
        number.sub(/(\d{11})(\d{2})/, '\\1-\\2')
      end
    end
  end
end
