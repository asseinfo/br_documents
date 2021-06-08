require_relative 'pattern1'

class BrDocuments::IE::PB < BrDocuments::IE::Pattern1
  private

  def format_ie(number)
    number.sub(/(\d{8})(\d{1})/, '\\1-\\2')
  end
end
