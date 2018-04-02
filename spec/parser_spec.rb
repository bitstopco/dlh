require "spec_helper"

RSpec.describe Dlh::Parser do
  parse = Dlh::Parser.new(Helper::VALID_DRIVERS_LICENSE)
  subject { parse }

  it "has correct class" do
    expect(subject.class).to eql Dlh::Parser
  end

  describe "id_version" do
    it "return correct id_version" do
      expect(parse.id_version).to eq("01")
    end
  end

  describe "codes" do
    it "return correct class_code" do
      expect(parse.class_code).to eq("E")
    end

    it "return correct endorsement_code" do
      expect(parse.endorsement_code).to eq("NONE")
    end

    it "return correct restriction_code" do
      expect(parse.restriction_code).to eq("NONE")
    end
  end  

  describe "id_number" do
    it "return correct id_number" do
      expect(parse.id_number).to eq("b132465932240")
    end
  end

  describe "height" do
    it "return correct height" do
      expect(parse.height).to eq("506")
    end
  end

  describe "name" do
    it "return correct full name" do
      expect(parse.name("full")).to eq("Jean Emmanuel Baptiste")
    end

    it "return correct first name" do
      expect(parse.name("first")).to eq("Jean")
    end

    it "return correct last name" do
      expect(parse.name("last")).to eq("Baptiste")
    end

    it "return correct middle name" do
      expect(parse.name("middle")).to eq("Emmanuel")
    end
  end

  describe "address" do
    it "return correct full address" do
      expect(parse.address("full")).to eq("520 NW 130TH ST, Miami, FL, 33168")
    end

    it "return correct address" do
      expect(parse.address[:address]).to eq("520 NW 130TH ST")
    end

    it "return correct city" do
      expect(parse.address[:city]).to eq("Miami")
    end

    it "return correct state" do
      expect(parse.address[:state]).to eq("FL")
    end

    it "return correct zipcode" do
      expect(parse.address[:zipcode]).to eq("33168")
    end
  end

  describe "gender" do
    it "return correct gender" do
      expect(parse.gender).to eq("Male")
    end
  end

  describe "dates" do
    it "return correct date of birth" do
      expect(parse.dob).to eq("19930624")
    end

    it "return correct issue date" do
      expect(parse.issue_date).to eq("20140303DBHN")
    end

    it "return correct expiration date" do
      expect(parse.expiration_date).to eq("20220624")
    end
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
end
