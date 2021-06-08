require_relative 'pattern1'

class BrDocuments::IE::RR < BrDocuments::IE::Pattern1
  def initialize(number)
    super
    @mask = /^(\d{8}\-\d{1})$|^(\d{9})$/
    @weight = [1, 2, 3, 4, 5, 6, 7, 8]
  end

  private

  def format_ie(number)
    number.sub(/(\d{8})(\d{1})/, '\\1-\\2')
  end

  def generate_check_digit(values, weights)
    sum = reduce_weights(values, weights)
    sum % 9
  end
end
