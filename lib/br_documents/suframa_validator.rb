class SuframaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      suframa = BrDocuments::Suframa.new(value)
      record.errors.add(attribute, :invalid) unless suframa.valid?
    end
  end
end
