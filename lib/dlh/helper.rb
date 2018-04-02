module Dlh
  class Helper
    def self.titlelize(content)
      return content.split(" ").map{|word| word.capitalize}.join(" ")
    end

    def self.genders(int)
      genders = {
        0 => 'Unknown',
        1 => 'Male',
        2 => 'Female',
        9 => 'Not Specified',
      }

      return genders[int.to_i]
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