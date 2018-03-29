module Dlh
  class Helper
    def self.titlelize(content)
      return content.split(" ").map{|word| word.capitalize}.join(" ")
    end
  end
end