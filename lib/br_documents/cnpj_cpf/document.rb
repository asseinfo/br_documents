require_relative '../commons/mod11'

class BrDocuments::CnpjCpf::Document
  include BrDocuments::Commons::Mod11

  def initialize(number)
    @number = number
  end

  def valid?
    valid_format? && !sequence_of_equal_numbers? && valid_check_digit?
  end

  def formatted
    valid? ? format_number : ''
  end

  private

  def valid_format?
    format_regex.match(@number).present?
  end

  def sequence_of_equal_numbers?
    number_without_mask.split('').uniq.length == 1
  end

  def valid_check_digit?
    weight1, weight2 = weights_for_digital_check

    digital_check1 = generate_check_digit(number_without_mask, weight1)
    digital_check2 = generate_check_digit(number_without_mask, weight2)
    @number[-2, 2] == "#{digital_check1}#{digital_check2}"
  end

  def number_without_mask
    @number.gsub(/[\.\/-]/, '')
  end
end
