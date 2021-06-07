class GtinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?

    gtin = BrDocuments::Gtin.new(value)
    record.errors.add(attribute, :invalid) unless gtin.valid?
  end
end
