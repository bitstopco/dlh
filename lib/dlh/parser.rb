module Dlh
  class Parser
    def initialize(data)
      @data = data.gsub(/\n/, "").gsub(/\s/, " ")
      @id_version = id_version
    end

    def parsed
      # get version of aamva (before 2000 or after)
      case id_version
      # version 01 year 2000
      when "01"
        return {
          id_version: id_version,
          id_number: id_number,
          class_code: class_code,
          endorsement_code: endorsement_code,
          restriction_code: restriction_code,
          name: name,
          dob: dob,
          gender: gender,
          address: address,
          issue_date: issue_date,
          expiration_date: expiration_date
        }
      when "04"
        return {
          id_version: id_version,
          id_number: id_number,
          class_code: class_code,
          name: name,
          dob: dob,
          gender: gender,
          address: address,
          issue_date: issue_date,
          expiration_date: expiration_date
        }
      when "08"
        return {
          id_version: id_version,
          id_number: id_number,
          name: name,
          dob: dob,
          gender: gender,
          address: address,
          issue_date: issue_date,
          expiration_date: expiration_date
        }
      when "09"
        return {
          id_version: id_version,
          id_number: id_number,
          class_code: class_code,
          name: name,
          dob: dob,
          gender: gender,
          address: address,
          issue_date: issue_date,
          expiration_date: expiration_date
        }
      end
    end

    def id_version      
      return @data.match(/[A-Z ]{5}\d{6}(\d{2})/)[1]
    end

    def id_number
      # Drivers license number
      case @id_version
      when "01"
        return @data.match(/DAQ.+(?=DAR)/).to_s.gsub("DAQ", "").downcase
      when "04"
        return @data.match(/DAQ.+(?=DCF)/).to_s.gsub("DAQ", "").downcase
      when "08", "09"
        return @data.match(/DAQ.+(?=DCS)/).to_s.gsub("DAQ", "").downcase
      end
    end

    def class_code
      # Driver License Classification Code
      return @data.match(/DAR(\w)/)[1]
    end

    def endorsement_code
      # Driver License Endorsements Code
      return @data.match(/DAT.+(?=DBA)/)[0].gsub("DAT", "")
    end

    def restriction_code
      # Driver License Restriction Code
      return @data.match(/DAS.+(?=DAT)/)[0].gsub("DAS", "")
    end

    def name(format=nil)
      # Driver License Name
      if @id_version == "01"
        nm = @data.match(/DAA.+(?=DAG)/)[0].gsub("DAA", "").gsub(/\s+/, "").split(",")
        nm = Helper.titlelize(nm.insert(2, nm.delete_at(0)).join(" "))  
      end
    
      if @id_version == "04"
        nm = Helper.titlelize([@data.match(/DAC.+(?=DAD)/)[0].gsub("DAC", ""), @data.match(/DAD.+(?=DBD)/)[0].gsub("DAD", ""), @data.match(/DCS.+(?=DAC)/)[0].gsub("DCS", "")].join(" "))
      end

      if @id_version == "09" || @id_version == "08"
        nm = Helper.titlelize([@data.match(/DAC.+(?=DDF)/)[0].gsub("DAC", ""), @data.match(/DAD.+(?=DDG)/)[0].gsub("DAD", ""), @data.match(/DCS.+(?=DDE)/)[0].gsub("DCS", "")].join(" "))
      end

      pnm = Fullname::Parser.parse_fullname(nm)

      case format
      when "full"
        return nm
      when "first"
        return pnm[:first]
      when "last"
        return pnm[:last]
      when "middle"
        return pnm[:middle]
      end

      return pnm
    end

    def address(format=nil)
      # Driver Mailing Street Address
      full_address = @data.match(/DAG.+(?=DAQ)/).to_s.gsub("DAG", "")
      if @id_version == "09" || @id_version == "08"
        full_address = @data.match(/DAG.+(?=DCF)/).to_s.gsub("DAG", "")
      end

      address = full_address.match(/.+(?=DAI)/)[0]
      city = Helper.titlelize(full_address.match(/DAI.+(?=DAJ)/)[0].gsub("DAI", ""))
      state = full_address.match(/DAJ.+(?=DAK)/)[0].gsub("DAJ", "")
      zipcode = full_address.match(/DAK(\d....)/)[1]

      case format
      when "full"
        return [address, city, state, zipcode].join(", ")
      end
      return {
        address: address,
        city: city,
        state: state,
        zipcode: zipcode
      }
    end

    def gender
      # Driver Sex
      return Helper.genders(@data.match(/DBC(\d)/)[0].gsub("DBC", ""))
    end

    def height
      # Height (FT/IN)
      return @data.match(/DAU(\d*)/)[1]
    end

    def dob
      # Date of Birth
      return Helper.format_date(@data.match(/DBB(\d*)/)[1], @id_version)
    end

    def issue_date
      # Driver License or ID Document Issue Date
      return Helper.format_date(@data.match(/DBD(\d*)/)[1], @id_version)
    end

    def expiration_date
      # Driver License Expiration Date
      return Helper.format_date(@data.match(/DBA(\d*)/)[1], @id_version)
    end
  end
end