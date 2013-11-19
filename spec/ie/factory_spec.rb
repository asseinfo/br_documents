require "spec_helper"

describe ValidaDocs::IE::Factory do
  describe ".create" do
    context "when uf is AC" do
      it "returns an instance of ValidaDocs::IE::AC" do
        ie = ValidaDocs::IE::Factory.create("AC", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::AC
      end
    end

    context "when uf is AL" do
      it "returns an instance of ValidaDocs::IE::AL" do
        ie = ValidaDocs::IE::Factory.create("AL", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::AL
      end
    end

    context "when uf is AP" do
      it "returns an instance of ValidaDocs::IE::AP" do
        ie = ValidaDocs::IE::Factory.create("AP", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::AP
      end
    end

    context "when uf is AM" do
      it "returns an instance of ValidaDocs::IE::AM" do
        ie = ValidaDocs::IE::Factory.create("AM", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::AM
      end
    end

    context "when uf is BA" do
      it "returns an instance of ValidaDocs::IE::BA" do
        ie = ValidaDocs::IE::Factory.create("BA", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::BA
      end
    end

    context "when uf is CE" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("CE", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is DF" do
      it "returns an instance of ValidaDocs::IE::DF" do
        ie = ValidaDocs::IE::Factory.create("DF", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::DF
      end
    end

    context "when uf is ES" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("ES", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is GO" do
      it "returns an instance of ValidaDocs::IE::GO" do
        ie = ValidaDocs::IE::Factory.create("GO", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::GO
      end
    end

    context "when uf is MA" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("MA", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is MG" do
      it "returns an instance of ValidaDocs::IE::MG" do
        ie = ValidaDocs::IE::Factory.create("MG", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::MG
      end
    end

    context "when uf is MS" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("MS", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is MT" do
      it "returns an instance of ValidaDocs::IE::MT" do
        ie = ValidaDocs::IE::Factory.create("MT", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::MT
      end
    end

    context "when uf is PA" do
      it "returns an instance of ValidaDocs::IE::PA" do
        ie = ValidaDocs::IE::Factory.create("PA", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::PA
      end
    end

    context "when uf is PB" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("PB", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is PR" do
      it "returns an instance of ValidaDocs::IE::PR" do
        ie = ValidaDocs::IE::Factory.create("PR", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::PR
      end
    end

    context "when uf is PE" do
      it "returns an instance of ValidaDocs::IE::PE" do
        ie = ValidaDocs::IE::Factory.create("PE", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::PE
      end
    end

    context "when uf is PI" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("PI", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is RJ" do
      it "returns an instance of ValidaDocs::IE::RJ" do
        ie = ValidaDocs::IE::Factory.create("RJ", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::RJ
      end
    end

    context "when uf is returns" do
      it "returns an instance of ValidaDocs::IE::RN" do
        ie = ValidaDocs::IE::Factory.create("RN", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::RN
      end
    end

    context "when uf is RS" do
      it "returns an instance of ValidaDocs::IE::RS" do
        ie = ValidaDocs::IE::Factory.create("RS", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::RS
      end
    end

    context "when uf is RO" do
      it "returns an instance of ValidaDocs::IE::RO" do
        ie = ValidaDocs::IE::Factory.create("RO", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::RO
      end
    end

    context "when uf is RR" do
      it "returns an instance of ValidaDocs::IE::RR" do
        ie = ValidaDocs::IE::Factory.create("RR", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::RR
      end
    end

    context "when uf is SC" do
      it "returns an instance of ValidaDocs::IE::SC" do
        ie = ValidaDocs::IE::Factory.create("SC", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::SC
      end
    end

    context "when uf is SP" do
      it "returns an instance of ValidaDocs::IE::SP" do
        ie = ValidaDocs::IE::Factory.create("SP", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::SP
      end
    end

    context "when uf is SE" do
      it "returns an instance of ValidaDocs::IE::Pattern1" do
        ie = ValidaDocs::IE::Factory.create("SE", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::Pattern1
      end
    end

    context "when uf is TO" do
      it "returns an instance of ValidaDocs::IE::TO" do
        ie = ValidaDocs::IE::Factory.create("TO", "123456789")
        expect(ie).to be_an_instance_of ValidaDocs::IE::TO
      end
    end


    context "when uf is invalid" do
      it "is returns an error" do
        expect{
            ValidaDocs::IE::Factory.create("", "")
          }.to raise_error(ArgumentError, t("validator.ie.uf.invalid"))
      end
    end
  end
end
