require_relative 'pattern2'

class BrDocuments::IE::AC < BrDocuments::IE::Pattern2
  def initialize(number)
    super
    @mask = /^(\d{2}\.\d{3}\.\d{3}\/\d{3}\-\d{2})$|^(\d{13})$/
  end

  private

  def format_ie(number)
    number.sub(/(\d{2})(\d{3})(\d{3})(\d{3})(\d{2})/, '\\1.\\2.\\3/\\4-\\5')
  end
end
