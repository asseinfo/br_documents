require_relative 'pattern1'

module BrDocuments
  module IE
    class PB < Pattern1
      private

      def format_ie(number)
        number.sub(/(\d{8})(\d{1})/, '\\1-\\2')
      end
    end
  end
end
