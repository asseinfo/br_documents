require "spec_helper"

describe BrDocuments::CnpjCpf::Cpf do
  describe "#formatted" do
    it "returns a formatted number" do
      cpf = BrDocuments::CnpjCpf::Cpf.new("11144477735")
      expect(cpf.formatted).to eq "111.444.777-35"
    end

    context "when is invalid" do
      it "returns an empty string" do
        cpf = BrDocuments::CnpjCpf::Cpf.new("123")
        expect(cpf.formatted).to eq ""
      end
    end
  end

  it "is invalid with malformed number" do
    ["111.126.491.07", "482.261.15-663", "111444.777-35"].each do |number|
      cpf = BrDocuments::CnpjCpf::Cpf.new(number)
      expect(cpf).to_not be_valid
    end
  end

  it "is invalid with a number longer than 11" do
    ["045.769.421-150", "308514217766"].each do |number|
      cpf = BrDocuments::CnpjCpf::Cpf.new(number)
      expect(cpf).to_not be_valid
    end
  end

  it "is invalid with a number shorter than 11" do
    ["111.444.777-3", "1234567890"].each do |number|
      cpf = BrDocuments::CnpjCpf::Cpf.new(number)
      expect(cpf).to_not be_valid
    end
  end

  it "is invalid with a sequence of the same number" do
    ["111.111.111-11", "22222222222"].each do |number|
      cpf = BrDocuments::CnpjCpf::Cpf.new(number)
      expect(cpf).to_not be_valid
    end
  end

  it "is invalid with invalid check number" do
    ["111.111.111-22", "2222222233"].each do |number|
      cpf = BrDocuments::CnpjCpf::Cpf.new(number)
      expect(cpf).to_not be_valid
    end
  end

  it "is valid with correct number" do
    ["111.444.777-35", "01233254120"].each do |number|
      cpf = BrDocuments::CnpjCpf::Cpf.new(number)
      expect(cpf).to be_valid
    end
  end
end
