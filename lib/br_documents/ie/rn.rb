require_relative "base"

module BrDocuments
  module IE
    class RN < Base
      include Commons::Mod11

      private
      def format_ie(number)
        if number.gsub(/(\.)|(\-)/, "").length == 9
          number.sub(/(\d{2})(\d{3})(\d{3})(\d{1})/, "\\1.\\2.\\3-\\4")
        else
          number.sub(/(\d{2})(\d{1})(\d{3})(\d{3})(\d{1})/, "\\1.\\2.\\3.\\4-\\5")
        end
      end

      def valid_format?
        valid_old_format or valid_new_format
      end

      def valid_old_format
        regex = /^(\d{2}\.\d{3}\.\d{3}\-\d{1}})$|^(\d{9})$/
        regex.match(@number).present?
      end

      def valid_new_format
        regex = /^(\d{2}\.\d{1}\.\d{3}\.\d{3}\-\d{1}})$|^(\d{10})$/
        regex.match(@number).present?
      end

      def valid_digital_check?
        @number.gsub!(/\./, "")

        weight = []
        @number.length.downto(2).each {|w| weight << w }

        @number[-1].eql? generate_digital_check(@number, weight).to_s
      end

      def generate_digital_check(values, weights)
        sum = reduce_weights(values, weights)
        mod = sum * 10 % 11
        mod == 10 ? 0 : mod
      end
    end
  end
end
