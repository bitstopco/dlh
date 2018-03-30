module Dlh
  class Parser
    def initialize(data)
      @data = data.gsub(/\n/, "").gsub(/\s/, " ")
    end

    def parsed
      case id_version
      when "01"
        return {
          id_version: id_version,
          id_number: id_number,
          name: name,
          dob: dob,
          gender: gender,
          address: address,
          issue_date: issue_date
        }
      end
    end

    def id_version      
      return @data.match(/[A-Z ]{5}\d{6}(\d{2})/)[1]
    end

    def id_number
      # Drivers license number
      return @data.match(/DAQ.+(?=DAR)/).to_s.gsub("DAQ", "").downcase
    end

    def name(format=nil)
      # Driver License Name
      nm = @data.match(/DAA.+(?=DAG)/)[0].gsub("DAA", "").gsub(/\s+/, "").split(",")
      nm = Helper.titlelize(nm.insert(2, nm.delete_at(0)).join(" "))
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
      address = full_address.match(/.+(?=DAI)/)[0]
      city = Helper.titlelize(full_address.match(/DAI.+(?=DAJ)/)[0].gsub("DAI", ""))
      state = full_address.match(/DAJ.+(?=DAK)/)[0].gsub("DAJ", "")
      zipcode = full_address.match(/DAK(\d*)/)[1]

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
      return Helper.genders(@data.match(/DBC.+(?=DBD)/)[0].gsub("DBC", ""))
    end

    def dob
      # Date of Birth
      return @data.match(/DBB.+(?=DBC)/)[0].gsub("DBB", "")
    end

    def issue_date
      # Driver License or ID Document Issue Date
      return @data.match(/DBD.+(?=DAU)/)[0].gsub("DBD", "")
    end
  end
end