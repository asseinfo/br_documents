require_relative 'pattern1'

class BrDocuments::IE::RS < BrDocuments::IE::Pattern1
  def initialize(number)
    super
    @mask = /^(\d{3}\/\d{7})$|^(\d{10})$/
    @weight = [2, 9, 8, 7, 6, 5, 4, 3, 2]
  end

  private

  def format_ie(number)
    number.sub(/(\d{3})(\d{7})/, '\\1/\\2')
  end
end
