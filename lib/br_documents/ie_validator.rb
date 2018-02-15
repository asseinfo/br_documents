class IeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if ie_present?(value)
      attribute_uf_was_configured_at_validator?(record) and
      can_read_uf_at_record?(options, record) and
      ie_valid?(record, attribute, value)
    end
  end

  private
  def ie_present?(value)
    value.present?
  end

  def attribute_uf_was_configured_at_validator?(record)
    record.errors.add(:base,
      I18n.t("validator.ie.uf.no_configured")) unless options[:uf].present?
    record.errors.messages.empty?
  end

  def can_read_uf_at_record?(options, record)
    begin
      read_uf(record)
    rescue NoMethodError
      record.errors.add(:base, I18n.t("validator.ie.uf.no_present",
        uf: options[:uf])
      )
    end
    record.errors.messages.empty?
  end

  def ie_valid?(record, attribute, value)
    begin
      record.errors.add(attribute, :invalid) unless number_valid?(record, value)
    rescue ArgumentError => ex
      record.errors.add(attribute, ex.message)
    end
    record.errors.messages.empty?
  end

  def number_valid?(record, value)
    uf = read_uf(record)
    ie_number = BrDocuments::IE::Factory.create(uf, value)
    ie_number.valid?
  end  

  def read_uf(record)
    attribute = record
    options[:uf].split("#").each do | field |
      attribute = attribute.send(field)
    end
    attribute
  end
end
