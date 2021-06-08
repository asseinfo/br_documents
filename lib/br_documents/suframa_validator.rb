class SuframaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    suframa = BrDocuments::Suframa.new(value)
    record.errors.add(attribute, :invalid) unless suframa.valid?
  end
end
