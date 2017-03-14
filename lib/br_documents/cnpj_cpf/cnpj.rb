require_relative "document"

module BrDocuments
  module CnpjCpf
    class Cnpj
      include Document

      private

      def format_regex
        /^(\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2})$|^(\d{14})$/
      end

      def weights_for_digital_check
        [[5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]]
      end

      def format_number
        @number.sub(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, "\\1.\\2.\\3/\\4-\\5")
      end
    end
  end
end
