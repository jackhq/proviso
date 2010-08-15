# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{proviso}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Wilson"]
  s.date = %q{2010-08-15}
  s.default_executable = %q{proviso}
  s.description = %q{TODO: longer description of your gem}
  s.email = %q{tom@jackhq.com}
  s.executables = ["proviso"]
  s.extra_rdoc_files = [
    "LICENSE"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "Rakefile",
     "VERSION",
     "bin/proviso",
     "lib/proviso.rb",
     "lib/proviso/command.rb",
     "lib/proviso/commands/base.rb",
     "lib/proviso/commands/plugins.rb",
     "lib/proviso/helpers.rb",
     "lib/proviso/plugin.rb",
     "lib/proviso/plugin_interface.rb",
     "readme.md",
     "spec/fixtures/proviso.yml",
     "spec/proviso/command_spec.rb",
     "spec/proviso_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/twilson63/proviso}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "spec/proviso/command_spec.rb",
     "spec/proviso_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

