require 'helpers'
require 'plugin'

require 'commands/base'


Dir["#{File.dirname(__FILE__)}/commands/*"].each { |c| require c }

module Proviso
  module Command
    class InvalidCommand < RuntimeError; end
    class CommandFailed  < RuntimeError; end

    class << self
      def run(command, args=[])
        Proviso::Plugin.load!
        run_internal(command, args)
      end
      
      def error(msg)
        STDERR.puts(msg)
        exit 1
      end
      
      
    private
      def run_internal(command, args)
        klass, method = parse(command)
        runner = klass.new(args)
        raise InvalidCommand unless runner.respond_to?(method)
        runner.send(method)
      end

      def parse(command)
        parts = command.split(':')
        return Proviso::Command.const_get(parts.first.capitalize), parts.last        
      end
            
    end
  end
end
