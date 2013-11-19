require_relative "document"

module ValidaDocs
  module CnpjCpf
    class Cnpj
      include Document

      def initialize(number)
        @number = number
      end

      def valid?
        regex = /^(\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2})$|^(\d{14})$/
        weight13 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        weight14 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

        valid_number?(@number, regex, weight13, weight14)
      end
    end
  end
end
