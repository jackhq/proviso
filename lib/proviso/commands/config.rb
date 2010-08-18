require 'fileutils'

module Proviso::Command
  class Config < Base

    def list
      display "List Config"
      if File.exists?(yaml_file)
        display open(yaml_file, 'r').read
      else
        error "config does not exists run config:create"
      end
    end
        
    
    def add
      if @args.length == 3
        modify_config_file
        display "successfully added config setting"
      else
        error "section, key and value pair required. eg. config:add [section] [key] [value]"
      end
    end
    
    def update
      if @args.length == 3
        modify_config_file
        display "successfully updated config setting"
      else
        error "section, key and value pair required. eg. config:update [section] [key] [value]"
      end
    end
    
    def create
      data = { "config" => { "hello" => 'world'}}
      if @args.length == 1
        data = YAML.load_file(yaml_file) if File.exists?(yaml_file)
        data.merge!(@args.first => {})
      else
        FileUtils.mkdir_p(File.join(home_directory, PROVISO_PATH))
      end
      open(yaml_file, 'w') { |f| f.write data.to_yaml }  
      display "created config file"
    end
    
  private
        
    def modify_config_file
      config_hash = YAML.load_file(yaml_file)
      config_hash[@args[0]].merge!({ @args[1] => @args[2] })
      open(yaml_file, 'w') { |f| f.write config_hash.to_yaml }      
    end
    
  end
end
