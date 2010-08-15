module Proviso::Command
  class Zerigo < Base
    def initialize(args)
      @args = args
      
    end
    
    def link
      url = args[0]
      ip = args[1]
      #link url to ip
    end
    
    def unlink
      url = args[0]
    end
    
    
  end
end

