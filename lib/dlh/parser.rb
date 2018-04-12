module Dlh
  class Parser
    def initialize(data)
      @data = data.gsub(/\n/, "").gsub(/\s/, " ")
      @version = id_version
    end

    def parsed
      parsed_data = {}
      # get version of aamva (before 2000 or after)
      case @version
      # version 01 year 2000
      when "01", "02"
        parsed_data[:id_version] = id_version
        parsed_data[:id_number] = id_number
        parsed_data[:class_code] = class_code
        parsed_data[:endorsement_code] = endorsement_code
        parsed_data[:restriction_code] = restriction_code
        parsed_data[:name] = name
        parsed_data[:dob] = dob
        parsed_data[:gender] = gender
        parsed_data[:address] = address
        parsed_data[:issue_date] = issue_date
        parsed_data[:expiration_date] = expiration_date
      when "04", "09"
        parsed_data[:id_version] = id_version
        parsed_data[:id_number] = id_number
        parsed_data[:class_code] = class_code
        parsed_data[:name] = name
        parsed_data[:dob] = dob
        parsed_data[:gender] = gender
        parsed_data[:address] = address
        parsed_data[:issue_date] = issue_date
        parsed_data[:expiration_date] = expiration_date
      when "08"
        parsed_data[:id_version] = id_version
        parsed_data[:id_number] = id_number
        parsed_data[:name] = name
        parsed_data[:dob] = dob
        parsed_data[:gender] = gender
        parsed_data[:address] = address
        parsed_data[:issue_date] = issue_date
        parsed_data[:expiration_date] = expiration_date
      end

      return parsed_data
    end

    def id_version      
      return @data.match(/[A-Z ]{5}\d{6}(\d{2})/)[1]
    end

    def id_number
      # Drivers license number
      case @version
      when "01"
        return @data.match(/DAQ.+(?=DAR)/).to_s.gsub("DAQ", "").downcase
      when "02"
        return @data.match(/DAQ.+(?=DBA)/).to_s.gsub("DAQ", "").downcase
      when "03", "04"
        return @data.match(/DAQ.+(?=DCF)/).to_s.gsub("DAQ", "").downcase
      when "06"
        num = @data.match(/DAQ.+(?=DCS)/).to_s.gsub("DAQ", "").downcase
        if num.length == 0
          num = @data.match(/DAQ.+(?=DCF)/).to_s.gsub("DAQ", "").downcase
        end
        return num        
      when "08", "09"
        return @data.match(/DAQ.+(?=DCS)/).to_s.gsub("DAQ", "").downcase
      end
    end

    def class_code
      # Driver License Classification Code
      return @data.match(/DAR(\w{1})/)[1]
    end

    def endorsement_code
      # Driver License Endorsements Code
      case @version
      when "02"
        return @data.match(/DAT.+(?=DBD)/)[0].gsub("DAT", "")
      else
        return @data.match(/DAT.+(?=DBA)/)[0].gsub("DAT", "")
      end      
    end

    def restriction_code
      # Driver License Restriction Code
      return @data.match(/DAS.+(?=DAT)/)[0].gsub("DAS", "").strip
    end

    def name(format=nil)
      # Driver License Name
      case @version
      when "01"
        nm = @data.match(/DAA.+(?=DAG)/)[0].gsub("DAA", "").gsub(/\s+/, "").split(",")
        nm = Helper.titlelize(nm.insert(2, nm.delete_at(0)).join(" "))
      when "02"
        nm = @data.match(/DAA.+(?=DAQ)/)[0].gsub("DAA", "").split(",")
        nm = Helper.titlelize([nm.last, nm.first].join(" "))
      when "03"
        nm = Helper.titlelize([@data.match(/DCT.+(?=DBD)/)[0].gsub("DCT", ""), @data.match(/DCS.+(?=DCT)/)[0].gsub("DCS", "")].join(" "))
      when "04"
        nm = Helper.titlelize([@data.match(/DAC.+(?=DAD)/)[0].gsub("DAC", ""), @data.match(/DAD.+(?=DBD)/)[0].gsub("DAD", ""), @data.match(/DCS.+(?=DAC)/)[0].gsub("DCS", "")].join(" "))
      # when "06"
        # nm = Helper.titlelize([@data.match(/DAC.+(?=DAD)/)[0].gsub("DAC", ""), @data.match(/DAD.+(?=DBD)/)[0].gsub("DAD", ""), @data.match(/DCS.+(?=DAC)/)[0].gsub("DCS", "")].join(" "))
      when "06", "08", "09"
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
      case @version
      when "06"
        full_address = @data.match(/DAG.+(?=DAQ)/).to_s.gsub("DAG", "")
        if full_address.length == 0
          full_address = @data.match(/DAG.+(?=DCF)/).to_s.gsub("DAG", "")  
        end
      when "02"
        full_address = @data.match(/DAG.+(?=DAR)/).to_s.gsub("DAG", "")
      when "08", "09"
        full_address = @data.match(/DAG.+(?=DCF)/).to_s.gsub("DAG", "")
      else
        full_address = @data.match(/DAG.+(?=DAQ)/).to_s.gsub("DAG", "")
      end

      address = full_address.match(/.+(?=DAI)/)[0].strip
      city = Helper.titlelize(full_address.match(/DAI.+(?=DAJ)/)[0].gsub("DAI", "")).strip
      state = full_address.match(/DAJ.+(?=DAK)/)[0].gsub("DAJ", "").strip
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
      case @version
      when "02"
        return @data.match(/DBC(\w{1})/)[1]
      else
        return Helper.genders(@data.match(/DBC(\d{1})/)[1])  
      end
    end

    def height
      # Height (FT/IN)
      return @data.match(/DAU(\d*)/)[1]
    end

    def dob
      # Date of Birth
      return Helper.format_date(@data.match(/DBB(\d*)/)[1], @version)
    end

    def issue_date
      # Driver License or ID Document Issue Date
      return Helper.format_date(@data.match(/DBD(\d*)/)[1], @version)
    end

    def expiration_date
      # Driver License Expiration Date
      return Helper.format_date(@data.match(/DBA(\d*)/)[1], @version)
    end
  end
end