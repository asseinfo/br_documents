class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    cnpj = BrDocuments::CnpjCpf::Cnpj.new(value)
    record.errors.add(attribute, :invalid) unless cnpj.valid?
  end
end
