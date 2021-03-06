module Dlh
  class Helper
    def self.titlelize(content)
      return content.split(" ").map{|word| word.capitalize}.join(" ")
    end

    def self.format_date(date, version)
      case version
      when "01", "01_v2", "02"
        return [date[4..5], date[6..8], date[0..3]].join("-")
      else
        return [date[0..1], date[2..3], date[4..7]].join("-")      
      end
    end

    def self.genders(int)
      genders = {
        "0" => 'Unknown',
        "1" => 'Male',
        "2" => 'Female',
        "9" => 'Not Specified',
        "U" => 'Unknown',
        "M" => 'Male',
        "F" => 'Female'
      }
      return genders[int]
    end

    def self.weight(int)
      weight = {
        0 => '0 - 70 lbs',
        1 => '71 - 100 lbs',
        2 => '101 - 130 lbs',
        3 => '131 - 160 lbs',
        4 => '161 - 190 lbs',
        5 => '191 - 220 lbs',
        6 => '221 - 250 lbs',
        7 => '251 - 280 lbs',
        8 => '281 - 320 lbs',
        9 => '321+ lbs'
      }
    end
  end
end