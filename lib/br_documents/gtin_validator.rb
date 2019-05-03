class GtinValidator  < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      gtin = BrDocuments::Gtin.new(value)
      record.errors.add(attribute, :invalid) if not gtin.valid?
    end
  end
end