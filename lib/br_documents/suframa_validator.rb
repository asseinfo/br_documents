class SuframaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      cpf = BrDocuments::CnpjCpf::Cpf.new(value)
      record.errors.add(attribute, :invalid) unless cpf.valid?
    end
  end
end
