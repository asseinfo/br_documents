require_relative "../commons/mod11"

module BrDocuments
  class Suframa
    include Commons::Mod11

    def initialize(number)
      @number = number
    end

    def formatted
      valid? ? format_number : ''
    end

    def valid?
      format_regex.match(@number).present? && !sequence_of_equal_numbers? && valid_verifying_digit?
    end
    
    private

    def weights_for_verifying_digit
      [9, 8, 7, 6, 5, 4, 3, 2]
    end

    def valid_verifying_digit?
      weight = weights_for_verifying_digit

      verifying_digit = generate_digital_check(number_without_mask, weight)
      number_without_mask[8].eql? verifying_digit.to_s
    end

    def format_regex
      # TODO: verificar se pode chegar alguma inscrição com 8 dígitos
      /^(\d{2}\.\d{4}\.\d{3})$|^(\d{9})$/
    end

    def format_number
      @number.sub(/(\d{2})(\d{4})(\d{3})/, "\\1.\\2.\\3")
    end

    def sequence_of_equal_numbers?
      number_without_mask.split("").uniq.length == 1
    end

    def number_without_mask
      @number.gsub('.', "")
    end
  end
end