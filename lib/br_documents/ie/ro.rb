require_relative 'base'
require_relative '../commons/mod14'

module BrDocuments
  module IE
    class RO < Base
      include Commons::Mod14

      protected

      def format_ie(number)
        if number.gsub(/(\.)|(\-)/, '').length == 9
          number.sub(/(\d{3})(\d{5})(\d{1})/, '\\1.\\2-\\3')
        else
          number.sub(/(\d{13})(\d{1})/, '\\1-\\2')
        end
      end

      def valid_format?
        valid_old_format or valid_new_format
      end

      def valid_check_digit?
        valid_old_digital_check or valid_new_digital_check
      end

      private

      def valid_old_format
        regex = /^(\d{3}\.\d{5}\-\d{1})$|^(\d{9})$/
        regex.match(@number).present?
      end

      def valid_new_format
        regex = /^(\d{13}\-\d{1})$|^(\d{14})$/
        regex.match(@number).present?
      end

      def valid_old_digital_check
        weight = [3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        remove_mask!
        @number[-1].eql? generate_check_digit(@number[-6, 6], weight).to_s
      end

      def valid_new_digital_check
        weight = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        remove_mask!
        @number[-1].eql? generate_check_digit(@number, weight).to_s
      end

      def remove_mask!
        @number.gsub!(/[\.\/-]/, '')
      end
    end
  end
end
