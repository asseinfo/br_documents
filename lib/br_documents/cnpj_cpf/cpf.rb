require_relative "document"

module BrDocuments
  module CnpjCpf
    class Cpf
      include Document

      private

      def format_regex
        /^(\d{3}\.\d{3}\.\d{3}-\d{2})$|^(\d{11})$/
      end

      def weights_for_digital_check
        [[10, 9, 8, 7, 6, 5, 4, 3, 2], [11, 10, 9, 8, 7, 6, 5, 4, 3, 2]]
      end

      def format_number
        @number.sub(/(\d{3})(\d{3})(\d{3})(\d{2})/, "\\1.\\2.\\3-\\4")
      end
    end
  end
end
