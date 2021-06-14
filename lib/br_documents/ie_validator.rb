class IeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    ie_present?(value) &&
      attribute_uf_was_configured_at_validator?(record) &&
      can_read_uf_at_record?(options, record) &&
      ie_valid?(record, attribute, value)
  end

  private

  def ie_present?(value)
    value.present?
  end

  def attribute_uf_was_configured_at_validator?(record)
    record.errors.add(:base, I18n.t('validator.ie.uf.no_configured')) if options[:uf].blank?

    options[:uf].present?
  end

  def can_read_uf_at_record?(options, record)
    begin
      uf = read_uf(record)
    rescue NoMethodError
      record.errors.add(
        :base, I18n.t('validator.ie.uf.no_present', uf: options[:uf])
      )
    end

    uf.present?
  end

  def ie_valid?(record, attribute, value)
    begin
      record.errors.add(attribute, :invalid) unless number_valid?(record, value)
    rescue ArgumentError => e
      record.errors.add(attribute, e.message)
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
    options[:uf].split('#').each do |field|
      attribute = attribute.send(field)
    end
    attribute
  end
end
