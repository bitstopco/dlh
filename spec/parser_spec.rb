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

  describe "id_number" do
    it "return correct id_number" do
      expect(parse.id_number).to eq("b132465932240")
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
  end

  describe "gender" do
    it "return correct gender" do
      expect(parse.gender).to eq("Male")
    end
  end

  describe "dob" do
    it "return correct date of birth" do
      expect(parse.dob).to eq("19930624")
    end
  end

  describe "issue_date" do
    it "return correct issue date" do
      expect(parse.issue_date).to eq("20140303DBHN")
    end
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end
end
