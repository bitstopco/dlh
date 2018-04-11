require "spec_helper"

RSpec.describe Dlh::Parser do
  parse_01 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_01)
  parse_04 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_04)
  parse_08 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_08)
  parse_09 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_09)
  subject { parse_01 }

  it "has correct class" do
    expect(subject.class).to eql Dlh::Parser
  end

  describe "id_version 01" do
    it "return correct id_version" do
      expect(parse_01.id_version).to eq("01")
    end

    describe "codes" do
      it "return correct class_code" do
        expect(parse_01.class_code).to eq("E")
      end

      it "return correct endorsement_code" do
        expect(parse_01.endorsement_code).to eq("NONE")
      end

      it "return correct restriction_code" do
        expect(parse_01.restriction_code).to eq("NONE")
      end
    end  

    it "return correct id_number" do
      expect(parse_01.id_number).to eq("b132465932240")
    end

    it "return correct height" do
      expect(parse_01.height).to eq("506")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_01.name("full")).to eq("Jean Emmanuel Baptiste")
      end

      it "return correct first name" do
        expect(parse_01.name("first")).to eq("Jean")
      end

      it "return correct last name" do
        expect(parse_01.name("last")).to eq("Baptiste")
      end

      it "return correct middle name" do
        expect(parse_01.name("middle")).to eq("Emmanuel")
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_01.address("full")).to eq("520 NW 130TH ST, Miami, FL, 33168")
      end

      it "return correct address" do
        expect(parse_01.address[:address]).to eq("520 NW 130TH ST")
      end

      it "return correct city" do
        expect(parse_01.address[:city]).to eq("Miami")
      end

      it "return correct state" do
        expect(parse_01.address[:state]).to eq("FL")
      end

      it "return correct zipcode" do
        expect(parse_01.address[:zipcode]).to eq("33168")
      end
    end

    it "return correct gender" do
      expect(parse_01.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_01.dob).to eq("06-24-1993")
      end

      it "return correct issue date" do
        expect(parse_01.issue_date).to eq("03-03-2014")
      end

      it "return correct expiration date" do
        expect(parse_01.expiration_date).to eq("06-24-2022")
      end
    end
  end

  # ----------------------------------------------

  describe "id_version 04" do
    it "return correct id_version" do
      expect(parse_04.id_version).to eq("04")
    end

    describe "codes" do
      it "return correct class_code" do
        expect(parse_04.class_code).to eq("R")
      end
    end

    it "return correct id_number" do
      expect(parse_04.id_number).to eq("d8721031")
    end

    it "return correct height" do
      expect(parse_04.height).to eq("070")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_04.name("full")).to eq("Darriean Maurice Nubia")
      end

      it "return correct first name" do
        expect(parse_04.name("first")).to eq("Darriean")
      end

      it "return correct last name" do
        expect(parse_04.name("last")).to eq("Nubia")
      end

      it "return correct middle name" do
        expect(parse_04.name("middle")).to eq("Maurice")
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_04.address("full")).to eq("3758 W 118TH ST, Hawthorne, CA, 90250")
      end

      it "return correct address" do
        expect(parse_04.address[:address]).to eq("3758 W 118TH ST")
      end

      it "return correct city" do
        expect(parse_04.address[:city]).to eq("Hawthorne")
      end

      it "return correct state" do
        expect(parse_04.address[:state]).to eq("CA")
      end

      it "return correct zipcode" do
        expect(parse_04.address[:zipcode]).to eq("90250")
      end
    end

    it "return correct gender" do
      expect(parse_04.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_04.dob).to eq("05-25-1990")
      end

      it "return correct issue date" do
        expect(parse_04.issue_date).to eq("03-25-2016")
      end

      it "return correct expiration date" do
        expect(parse_04.expiration_date).to eq("05-25-2018")
      end
    end
  end

  # ----------------------------------------------

  describe "id_version 08" do
    it "return correct id_version" do
      expect(parse_08.id_version).to eq("08")
    end

    it "return correct id_number" do
      expect(parse_08.id_number).to eq("m46062490348")
    end

    it "return correct height" do
      expect(parse_08.height).to eq("071")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_08.name("full")).to eq("Niko D Miller")
      end

      it "return correct first name" do
        expect(parse_08.name("first")).to eq("Niko")
      end

      it "return correct last name" do
        expect(parse_08.name("last")).to eq("Miller")
      end

      it "return correct middle name" do
        expect(parse_08.name("middle")).to eq("D")
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_08.address("full")).to eq("2617 N HOYNE AVENUE, Chicago, IL, 60647")
      end

      it "return correct address" do
        expect(parse_08.address[:address]).to eq("2617 N HOYNE AVENUE")
      end

      it "return correct city" do
        expect(parse_08.address[:city]).to eq("Chicago")
      end

      it "return correct state" do
        expect(parse_08.address[:state]).to eq("IL")
      end

      it "return correct zipcode" do
        expect(parse_08.address[:zipcode]).to eq("60647")
      end
    end

    it "return correct gender" do
      expect(parse_08.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_08.dob).to eq("12-07-1990")
      end

      it "return correct issue date" do
        expect(parse_08.issue_date).to eq("01-19-2018")
      end

      it "return correct expiration date" do
        expect(parse_08.expiration_date).to eq("12-07-2021")
      end
    end
  end

  # ----------------------------------------------

  describe "id_version 09" do
    it "return correct id_version" do
      expect(parse_09.id_version).to eq("09")
    end

    describe "codes" do
      it "return correct class_code" do
        expect(parse_09.class_code).to eq("A")
      end
    end  

    it "return correct id_number" do
      expect(parse_09.id_number).to eq("m430321902210")
    end

    it "return correct height" do
      expect(parse_09.height).to eq("070")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_09.name("full")).to eq("Helton Arando Mallette")
      end

      it "return correct first name" do
        expect(parse_09.name("first")).to eq("Helton")
      end

      it "return correct last name" do
        expect(parse_09.name("last")).to eq("Mallette")
      end

      it "return correct middle name" do
        expect(parse_09.name("middle")).to eq("Arando")
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_09.address("full")).to eq("21107 NW 14TH PL APT 439, Miami, FL, 33169")
      end

      it "return correct address" do
        expect(parse_09.address[:address]).to eq("21107 NW 14TH PL APT 439")
      end

      it "return correct city" do
        expect(parse_09.address[:city]).to eq("Miami")
      end

      it "return correct state" do
        expect(parse_09.address[:state]).to eq("FL")
      end

      it "return correct zipcode" do
        expect(parse_09.address[:zipcode]).to eq("33169")
      end
    end

    it "return correct gender" do
      expect(parse_09.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_09.dob).to eq("06-21-1990")
      end

      it "return correct issue date" do
        expect(parse_09.issue_date).to eq("03-28-2016")
      end

      it "return correct expiration date" do
        expect(parse_09.expiration_date).to eq("06-21-2024")
      end
    end
  end
end
