module Dlh
  class Parser
    def initialize(data)
      @data = data
      clean_up
    end

    def clean_up
      puts @data
    end
  end
end