class CpfValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.present?

    cpf = BrDocuments::CnpjCpf::Cpf.new(value)
    record.errors.add(attribute, :invalid) unless cpf.valid?
  end
end
