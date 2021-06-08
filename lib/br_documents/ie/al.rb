require_relative 'pattern1'

class BrDocuments::IE::AL < BrDocuments::IE::Pattern1
  def initialize(number)
    super
    @mask = /(\d{9})$/
  end

  private

  def format_ie(number)
    number
  end
end
