require_relative 'pattern1'

module BrDocuments
  module IE
    class TO < Pattern1
      def initialize(number)
        super
        if number.gsub(/(\.)|(\-)/, '').length == 9
          @mask = /^(\d{2}\.\d{6}\-\d{1})$|^(\d{9})$/
          @weight = [9, 8, 7, 6, 5, 4, 3, 2]
        else
          @mask = /^(\d{2}\.\d{2}\.\d{6}\-\d{1})$|^(\d{11})$/
          @weight = [9, 8, 0, 0, 7, 6, 5, 4, 3, 2]
        end
      end

      private

      def format_ie(number)
        if number.gsub(/(\.)|(\-)/, '').length == 9
          number.sub(/(\d{2})(\d{6})(\d{1})/, '\\1.\\2-\\3')
        else
          number.sub(/(\d{2})(\d{2})(\d{6})(\d{1})/, '\\1.\\2.\\3-\\4')
        end
      end
    end
  end
end
