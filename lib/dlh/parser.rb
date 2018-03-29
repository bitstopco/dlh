module Dlh
  class Parser
    def initialize(data)
      # @data = data
      @data = "ANSI 6360100102DL00390171ZF02100043DL\nDAAVERA,\nDAINEL, HOMERO\nDAG133 NE 2ND AVE APT 2717\nDAIMIAMI\nDAJFL\nDAK33132-2918 \nDAQV600168903050DARE   DASNONEDATNONE\nDBA20210825\nDBB19900825\nDBC1\nDBD20140812\nDAU510ZFZFAZFBZFCS071408120293ZFDZFE09-01-12"
      @data = @data.gsub(/\n/, "").gsub(/\s/, " ")
      @version = @data.match(/[A-Z ]{5}\d{6}(\d{2})/).to_s.match(/.{2}$/).to_s

      parse_it
    end

    def parse_it
      case @version
      when "01"
        # Drivers license number
        puts @data.match(/DAQ.+(?=DAR)/).to_s.gsub("DAQ", "")

        # Driver License Name
        puts @data.match(/DAA.+(?=DAG)/).to_s.gsub("DAA", "").gsub(/\s+/, "").split(",")
        
        # Driver Mailing Street Address
        puts @data.match(/DAG.+(?=DAQ)/).to_s.gsub("DAG", "")

        # Date of Birth
        puts @data.match(/DBB.+(?=DBC)/).to_s.gsub("DBB", "") 
        
        # Driver Sex
        puts @data.match(/DBC.+(?=DBD)/).to_s.gsub("DBC", "")     

        # Driver License or ID Document Issue Date
        puts @data.match(/DBD.+(?=DAU)/).to_s.gsub("DBD", "")                
      end
    end
  end
end