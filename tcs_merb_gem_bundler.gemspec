# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tcs_merb_gem_bundler}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Corey Donohoe as Proxy for TCS Himself"]
  s.autorequire = %q{tcs_merb_gem_bundler}
  s.date = %q{2008-10-30}
  s.description = %q{A gem that provides functional gem bundling in merb}
  s.email = %q{atmos@atmos.org}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "TODO", "bin/tcs_merb_gem_bundler", "bin/templates", "bin/templates/check", "bin/templates/gems.yml", "bin/templates/merb", "bin/templates/rake", "bin/templates/spec", "bin/templates/update", "lib/tcs_merb_gem_bundler.rb", "spec/spec_helper.rb", "spec/tcs_merb_gem_bundler_spec.rb", "README"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/atmos/tcs_merb_gem_bundler/tree/master}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{A gem that provides functional gem bundling in merb}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end