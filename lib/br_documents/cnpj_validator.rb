class CnpjValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?

    cnpj = BrDocuments::CnpjCpf::Cnpj.new(value)
    record.errors.add(attribute, :invalid) unless cnpj.valid?
  end
end
