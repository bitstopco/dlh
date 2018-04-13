require "spec_helper"

RSpec.describe Dlh::Parser do
  parse_01 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_01)
  parse_01_v2 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_01_v2)
  parse_02 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_02)
  parse_03 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_03)
  parse_04 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_04)
  parse_06 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_06)
  parse_06_v2 = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE_06_v2)
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

  describe "id_version 01_v2" do
    it "return correct id_version" do
      expect(parse_01_v2.id_version).to eq("01")
    end

    describe "codes" do
      it "return correct class_code" do
        expect(parse_01_v2.class_code).to eq("D")
      end

      it "return correct endorsement_code" do
        expect(parse_01_v2.endorsement_code).to eq("     ")
      end

      it "return correct restriction_code" do
        expect(parse_01_v2.restriction_code).to eq("")
      end
    end  

    it "return correct id_number" do
      expect(parse_01_v2.id_number).to eq("287626792")
    end

    it "return correct height" do
      expect(parse_01_v2.height).to eq("506")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_01_v2.name("full")).to eq("Chad Williams")
      end

      it "return correct first name" do
        expect(parse_01_v2.name("first")).to eq("Chad")
      end

      it "return correct last name" do
        expect(parse_01_v2.name("last")).to eq("Williams")
      end

      it "return correct middle name" do
        expect(parse_01_v2.name("middle")).to eq(nil)
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_01_v2.address("full")).to eq("941 PARTRIDGE RD, Orangeburg, SC, 29118")
      end

      it "return correct address" do
        expect(parse_01_v2.address[:address]).to eq("941 PARTRIDGE RD")
      end

      it "return correct city" do
        expect(parse_01_v2.address[:city]).to eq("Orangeburg")
      end

      it "return correct state" do
        expect(parse_01_v2.address[:state]).to eq("SC")
      end

      it "return correct zipcode" do
        expect(parse_01_v2.address[:zipcode]).to eq("29118")
      end
    end

    it "return correct gender" do
      expect(parse_01_v2.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_01_v2.dob).to eq("05-17-1994")
      end

      it "return correct issue date" do
        expect(parse_01_v2.issue_date).to eq("05-26-2016")
      end

      it "return correct expiration date" do
        expect(parse_01_v2.expiration_date).to eq("05-17-2026")
      end
    end
  end

  # ----------------------------------------------

  describe "id_version 02" do
    it "return correct id_version" do
      expect(parse_02.id_version).to eq("02")
    end

    describe "codes" do
      it "return correct class_code" do
        expect(parse_02.class_code).to eq("D")
      end

      it "return correct endorsement_code" do
        expect(parse_02.endorsement_code).to eq("*****")
      end

      it "return correct restriction_code" do
        expect(parse_02.restriction_code).to eq("********")
      end
    end  

    it "return correct id_number" do
      expect(parse_02.id_number).to eq("b50068093246")
    end

    it "return correct height" do
      expect(parse_02.height).to eq("511")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_02.name("full")).to eq("Paul Beene Jr")
      end

      it "return correct first name" do
        expect(parse_02.name("first")).to eq("Paul")
      end

      it "return correct last name" do
        expect(parse_02.name("last")).to eq("Beene")
      end

      it "return correct middle name" do
        expect(parse_02.name("middle")).to eq(nil)
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_02.address("full")).to eq("7309 S PAXTON, Chicago, IL, 60649")
      end

      it "return correct address" do
        expect(parse_02.address[:address]).to eq("7309 S PAXTON")
      end

      it "return correct city" do
        expect(parse_02.address[:city]).to eq("Chicago")
      end

      it "return correct state" do
        expect(parse_02.address[:state]).to eq("IL")
      end

      it "return correct zipcode" do
        expect(parse_02.address[:zipcode]).to eq("60649")
      end
    end

    it "return correct gender" do
      expect(parse_02.gender).to eq("M")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_02.dob).to eq("08-29-1993")
      end

      it "return correct issue date" do
        expect(parse_02.issue_date).to eq("03-25-2016")
      end

      it "return correct expiration date" do
        expect(parse_02.expiration_date).to eq("08-29-2019")
      end
    end
  end

  # ----------------------------------------------

  describe "id_version 03" do
    it "return correct id_version" do
      expect(parse_03.id_version).to eq("03")
    end

    it "return correct id_number" do
      expect(parse_03.id_number).to eq("369778100")
    end

    it "return correct height" do
      expect(parse_03.height).to eq("602")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_03.name("full")).to eq("Salimou Dabo")
      end

      it "return correct first name" do
        expect(parse_03.name("first")).to eq("Salimou")
      end

      it "return correct last name" do
        expect(parse_03.name("last")).to eq("Dabo")
      end

      it "return correct middle name" do
        expect(parse_03.name("middle")).to eq(nil)
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_03.address("full")).to eq("1576 TAYLOR AVE 3F, Bronx, NY, 10460")
      end

      it "return correct address" do
        expect(parse_03.address[:address]).to eq("1576 TAYLOR AVE 3F")
      end

      it "return correct city" do
        expect(parse_03.address[:city]).to eq("Bronx")
      end

      it "return correct state" do
        expect(parse_03.address[:state]).to eq("NY")
      end

      it "return correct zipcode" do
        expect(parse_03.address[:zipcode]).to eq("10460")
      end
    end

    it "return correct gender" do
      expect(parse_03.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_03.dob).to eq("10-09-1985")
      end

      it "return correct issue date" do
        expect(parse_03.issue_date).to eq("10-11-2014")
      end

      it "return correct expiration date" do
        expect(parse_03.expiration_date).to eq("10-09-2018")
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

  describe "id_version 06" do
    it "return correct id_version" do
      expect(parse_06.id_version).to eq("06")
    end

    it "return correct id_number" do
      expect(parse_06.id_number).to eq("056891746")
    end

    it "return correct height" do
      expect(parse_06.height).to eq("068")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_06.name("full")).to eq("Dwight Anthony Zelton Jones")
      end

      it "return correct first name" do
        expect(parse_06.name("first")).to eq("Dwight")
      end

      it "return correct last name" do
        expect(parse_06.name("last")).to eq("Jones")
      end

      it "return correct middle name" do
        expect(parse_06.name("middle")).to eq("Anthony Zelton")
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_06.address("full")).to eq("2825 ROBINSON WOOD DR, Riverdale, GA, 30296")
      end

      it "return correct address" do
        expect(parse_06.address[:address]).to eq("2825 ROBINSON WOOD DR")
      end

      it "return correct city" do
        expect(parse_06.address[:city]).to eq("Riverdale")
      end

      it "return correct state" do
        expect(parse_06.address[:state]).to eq("GA")
      end

      it "return correct zipcode" do
        expect(parse_06.address[:zipcode]).to eq("30296")
      end
    end

    it "return correct gender" do
      expect(parse_06.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_06.dob).to eq("07-29-1994")
      end

      it "return correct issue date" do
        expect(parse_06.issue_date).to eq("12-01-2017")
      end

      it "return correct expiration date" do
        expect(parse_06.expiration_date).to eq("07-29-2025")
      end
    end
  end

  # ----------------------------------------------

  describe "id_version 06_v2" do
    it "return correct id_version" do
      expect(parse_06_v2.id_version).to eq("06")
    end

    it "return correct id_number" do
      expect(parse_06_v2.id_number).to eq("121665492")
    end

    it "return correct height" do
      expect(parse_06_v2.height).to eq("063")
    end

    describe "name" do
      it "return correct full name" do
        expect(parse_06_v2.name("full")).to eq("Lorenzo Dontavius Jackson")
      end

      it "return correct first name" do
        expect(parse_06_v2.name("first")).to eq("Lorenzo")
      end

      it "return correct last name" do
        expect(parse_06_v2.name("last")).to eq("Jackson")
      end

      it "return correct middle name" do
        expect(parse_06_v2.name("middle")).to eq("Dontavius")
      end
    end

    describe "address" do
      it "return correct full address" do
        expect(parse_06_v2.address("full")).to eq("6846 INNSBROOK CV, Memphis, TN, 38115")
      end

      it "return correct address" do
        expect(parse_06_v2.address[:address]).to eq("6846 INNSBROOK CV")
      end

      it "return correct city" do
        expect(parse_06_v2.address[:city]).to eq("Memphis")
      end

      it "return correct state" do
        expect(parse_06_v2.address[:state]).to eq("TN")
      end

      it "return correct zipcode" do
        expect(parse_06_v2.address[:zipcode]).to eq("38115")
      end
    end

    it "return correct gender" do
      expect(parse_06_v2.gender).to eq("Male")
    end

    describe "dates" do
      it "return correct date of birth" do
        expect(parse_06_v2.dob).to eq("07-21-1996")
      end

      it "return correct issue date" do
        expect(parse_06_v2.issue_date).to eq("04-22-2016")
      end

      it "return correct expiration date" do
        expect(parse_06_v2.expiration_date).to eq("04-22-2024")
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
