class BrDocuments::IE::Base
  def initialize(number)
    @number = number
  end

  def valid?
    valid_format? and valid_check_digit?
  end

  def formatted
    format_ie(@number)
  end
end
