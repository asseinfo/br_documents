require_relative "../commons/mod11"

class BrDocuments::Suframa
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
    valid_check_digit? &&
    valid_activity_sector? &&
    valid_adm_unit?
  end

  private

  def valid_pattern?
    /^(\d{2}\.\d{4}\.\d{3})$|^(\d{9})$/.match(@number).present?
  end

  def sequence_of_equal_numbers?
    number_without_mask.split("").uniq.length == 1
  end

  def number_without_mask
    @number_without_mask ||= @number.gsub('.', "")
  end

  def valid_check_digit?
    weights = [9, 8, 7, 6, 5, 4, 3, 2]

    check_digit = generate_digital_check(number_without_mask, weights)
    number_without_mask[8] == check_digit.to_s
  end

  def valid_activity_sector?
    number = number_without_mask[0] + number_without_mask[1]

    ['01', '02', '10', '11', '20', '60'].include?(number)
  end

  def valid_adm_unit?
    number = number_without_mask[6] + number_without_mask[7]

    ['01', '10', '30'].include?(number)
  end

  def format_number
    @number.sub(/(\d{2})(\d{4})(\d{3})/, "\\1.\\2.\\3")
  end
end
