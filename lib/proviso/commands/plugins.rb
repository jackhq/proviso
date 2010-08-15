module Proviso::Command
  class Plugins < Base
    def list
      ::Proviso::Plugin.list.each do |plugin|
        display plugin
      end
    end
    alias :index :list

    def install
      plugin = Proviso::Plugin.new(@args.shift)
      if plugin.install
        display "#{plugin} installed"
      else
        error "Could not install #{plugin}. Please check the URL and try again"
      end
    end

    def uninstall
      plugin = Proviso::Plugin.new(@args.shift)
      plugin.uninstall
      display "#{plugin} uninstalled"
    end
  end
end
