require_relative "document"

module BrDocuments
  module CnpjCpf
    class Cpf
      include Document

      def initialize(number)
        @number = number
      end

      def valid?
        regex = /^(\d{3}\.\d{3}\.\d{3}-\d{2})$|^(\d{11})$/
        weight10 = [10, 9, 8, 7, 6, 5, 4, 3, 2]
        weight11 = [11, 10, 9, 8, 7, 6, 5, 4, 3, 2]

        valid_number?(@number, regex, weight10, weight11)
      end

      def formatted
        @number.sub(/(\d{3})(\d{3})(\d{3})(\d{2})/, "\\1.\\2.\\3-\\4")
      end
    end
  end
end
