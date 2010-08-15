require 'plugin_interface'

module Proviso::Command
  class Base
    include Proviso::Helpers
    include Proviso::PluginInterface

    attr_accessor :args

    def initialize(args)
      @args = args
    end
    
    def display(msg, newline=true)
      if newline
        puts(msg)
      else
        print(msg)
        STDOUT.flush
      end
    end
    
    def error(msg)
      Proviso::Command.error(msg)
    end
    
    def extract_option(options, default=true)
      values = options.is_a?(Array) ? options : [options]
      return unless opt_index = args.select { |a| values.include? a }.first
      opt_position = args.index(opt_index) + 1
      if args.size > opt_position && opt_value = args[opt_position]
        if opt_value.include?('--')
          opt_value = nil
        else
          args.delete_at(opt_position)
        end
      end
      opt_value ||= default
      args.delete(opt_index)
      block_given? ? yield(opt_value) : opt_value
    end
    
    
  end
  
end
