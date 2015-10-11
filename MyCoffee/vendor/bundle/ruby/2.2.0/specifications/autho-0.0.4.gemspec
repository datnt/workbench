# -*- encoding: utf-8 -*-
# stub: autho 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "autho"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Henrik Nyh"]
  s.date = "2013-09-11"
  s.email = ["henrik@nyh.se"]
  s.homepage = "http://github.com/henrik/autho"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "A many-stop shop for authentication."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<attr_extras>, [">= 1.6.2"])
      s.add_runtime_dependency(%q<bcrypt-ruby>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<attr_extras>, [">= 1.6.2"])
      s.add_dependency(%q<bcrypt-ruby>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<attr_extras>, [">= 1.6.2"])
    s.add_dependency(%q<bcrypt-ruby>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
