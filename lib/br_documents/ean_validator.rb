class EanValidator  < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      ean = BrDocuments::Ean.new(value)
      record.errors.add(attribute, :invalid) if not ean.valid?
    end
  end
end