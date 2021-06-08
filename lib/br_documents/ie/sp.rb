require_relative 'base'
require_relative '../commons/mod11'

class BrDocuments::IE::SP < BrDocuments::IE::Base
  include BrDocuments::Commons::Mod11

  protected

  def format_ie(number)
    if number.gsub(/(\-)|(\.)|(\/)/, '').length == 13
      number.sub(/(\w{1})(\d{8})(\d{1})(\d{3})/, '\\1-\\2.\\3/\\4')
    else
      number.sub(/(\d{3})(\d{3})(\d{3})(\d{3})/, '\\1.\\2.\\3.\\4')
    end
  end

  def valid_format?
    regex = /^(\d{3}\.\d{3}\.\d{3}\.\d{3})$|^(\d{12})$|^(P-\d{8}\.\d{1}\/\d{3})$/
    regex.match(@number).present?
  end

  def valid_check_digit?
    if @number[0] == 'P'
      valid_rural_producer_digital_check?
    else
      valid_standard_digital_check?
    end
  end

  private

  def valid_standard_digital_check?
    @number.gsub!(/[\.\/P-]/, '')

    weight1 = [1, 3, 4, 5, 6, 7, 8, 10]
    weight2 = [3, 2, 10, 9, 8, 7, 6, 5, 4, 3, 2]

    dc1 = generate_check_digit(weight1)
    dc2 = generate_check_digit(weight2)

    (@number[8] == dc1) and (@number[11] == dc2)
  end

  def valid_rural_producer_digital_check?
    @number.gsub!(/[\.\/P-]/, '')
    weight9 = [1, 3, 4, 5, 6, 7, 8, 10]
    @number[8] == generate_check_digit(weight9)
  end

  def generate_check_digit(weights)
    sum = reduce_weights(@number, weights)
    mod = sum % 11
    mod.to_s[-1]
  end
end
