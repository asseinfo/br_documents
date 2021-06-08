require_relative 'base'
require_relative '../commons/mod11'

class BrDocuments::IE::Pattern1 < BrDocuments::IE::Base
  include BrDocuments::Commons::Mod11

  def initialize(number)
    super
    @mask = /^(\d{8}\-\d{1})$|^(\d{9})$/
    @weight = [9, 8, 7, 6, 5, 4, 3, 2]
  end

  protected

  def valid_format?
    regex = @mask
    regex.match(@number).present?
  end

  def valid_check_digit?
    calculated_check_digit = generate_check_digit(only_numbers, @weight).to_s
    check_digit_valid = check_digit == calculated_check_digit
    remove_mask_of_number if check_digit_valid

    check_digit_valid
  end

  private

  def check_digit
    only_numbers[-1]
  end

  def remove_mask_of_number
    @number.replace only_numbers
  end

  def only_numbers
    @number.gsub(/[\.\/-]/, '')
  end
end
