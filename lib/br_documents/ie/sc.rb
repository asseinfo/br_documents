require_relative 'pattern1'

module BrDocuments
  module IE
    class SC < Pattern1
      def initialize(number)
        super
        @mask = /^(\d{3}\.\d{3}\.\d{3})$|^(\d{9})$/
      end

      private

      def format_ie(number)
        number.sub(/(\d{3})(\d{3})(\d{3})/, '\\1.\\2.\\3')
      end
    end
  end
end
