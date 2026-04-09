require_relative 'document'

module BrDocuments
  module CnpjCpf
    class Cnpj
      include Document

      private

      def format_regex
        /^([A-Z0-9]{2}\.[A-Z0-9]{3}\.[A-Z0-9]{3}\/[A-Z0-9]{4}-\d{2})$|^([A-Z0-9]{12}\d{2})$/
      end

      def weights_for_digital_check
        [[5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2], [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]]
      end

      def format_number
        mask = /\A([A-Z0-9]{2})([A-Z0-9]{3})([A-Z0-9]{3})([A-Z0-9]{4})(\d{2})\z/
        remove_mask.sub(mask, '\\1.\\2.\\3/\\4-\\5')
      end
    end
  end
end
