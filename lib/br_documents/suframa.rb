require_relative './commons/mod11'

module BrDocuments
  class Suframa
    include BrDocuments::Commons::Mod11

    def initialize(number)
      @number = number
    end

    def formatted
      valid? ? format_number : ''
    end

    def valid?
      valid_pattern? &&
        !sequence_of_equal_numbers? &&
        valid_check_digit?
    end

    private

    def valid_pattern?
      /^(\d{2}\.\d{4}\.\d{3})$|^(\d{9})$/.match(@number).present?
    end

    def sequence_of_equal_numbers?
      number_without_mask.chars.uniq.length == 1
    end

    def number_without_mask
      @number_without_mask ||= @number.delete('.')
    end

    def valid_check_digit?
      weights = [9, 8, 7, 6, 5, 4, 3, 2]

      check_digit = generate_check_digit(number_without_mask, weights)
      number_without_mask[8] == check_digit.to_s
    end

    def format_number
      @number.sub(/(\d{2})(\d{4})(\d{3})/, '\\1.\\2.\\3')
    end
  end
end
