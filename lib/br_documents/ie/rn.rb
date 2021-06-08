require_relative 'base'
require_relative '../commons/mod11'

module BrDocuments
  module IE
    class RN < Base
      include Commons::Mod11

      protected

      def format_ie(number)
        if number.gsub(/(\.)|(\-)/, '').length == 9
          number.sub(/(\d{2})(\d{3})(\d{3})(\d{1})/, '\\1.\\2.\\3-\\4')
        else
          number.sub(/(\d{2})(\d{1})(\d{3})(\d{3})(\d{1})/, '\\1.\\2.\\3.\\4-\\5')
        end
      end

      def valid_format?
        valid_old_format or valid_new_format
      end

      def valid_check_digit?
        @number.gsub!(/[\.\/-]/, '')

        weight = []
        @number.length.downto(2).each { |w| weight << w }

        @number[-1] == generate_check_digit(@number, weight).to_s
      end

      private

      def valid_old_format
        regex = /^(\d{2}\.\d{3}\.\d{3}\-\d{1})$|^(\d{9})$/
        regex.match(@number).present?
      end

      def valid_new_format
        regex = /^(\d{2}\.\d{1}\.\d{3}\.\d{3}\-\d{1})$|^(\d{10})$/
        regex.match(@number).present?
      end

      def generate_check_digit(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum * 10 % 11
        mod == 10 ? 0 : mod
      end
    end
  end
end
