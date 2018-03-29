module Dlh
  class Parser
    def initialize(data)
      @data = data.gsub(/\n/, "").gsub(/\s/, " ")
      parse_it
    end

    def parse_it
      case id_version
      when "01"
        # Date of Birth
        puts @data.match(/DBB.+(?=DBC)/).to_s.gsub("DBB", "") 
        
        # Driver Sex
        puts @data.match(/DBC.+(?=DBD)/).to_s.gsub("DBC", "")     

        # Driver License or ID Document Issue Date
        puts @data.match(/DBD.+(?=DAU)/).to_s.gsub("DBD", "")                
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
  end
end