require 'fileutils'

module Proviso::Command
  class Config < Base

    def list
      display "List Config"
    end
    
    def add
      if @args.length > 0
        display "config:add [section] [key] [value]"
      else
        error "key and value pair required. eg. config:add [section] [key] [value]"
      end
    end
    
    def update
      if @args.length > 0
        display "config:update [section] [key] [value]"
      else
        error "key and value pair required. eg. config:update [section] [key] [value]"
      end
    end
    
    def create
      PROVISO_PATH = home_directory + '/.proviso'
      CONFIG_FILE = PROVISO_PATH + '/proviso.yml'

      FileUtils.mkdir_p(PROVISO_PATH)
      open(CONFIG_FILE, 'w') { |f| f.write "---" }  
    end
    
    
  end
end
