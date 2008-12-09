require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'
require 'spec/rake/spectask'

GEM_NAME = "rubundler"
GEM_VERSION = "0.0.4"
AUTHOR = "Corey Donohoe as Proxy for TCS Himself"
EMAIL = "atmos@atmos.org"
HOMEPAGE = "http://github.com/atmos/rubundler/tree/master"
SUMMARY = "A gem that provides functional gem bundling in merb"

spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  # Uncomment this to add a dependency
  # s.add_dependency "foo"
  
  s.require_path = 'lib'
  s.autorequire = GEM_NAME
  s.files = %w(LICENSE README.rdoc Rakefile TODO) + Dir.glob("{bin,lib,spec}/**/*")
  s.bindir = "bin"
  s.executables = %w( rubundler )
end

task :default => :spec

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM_NAME}-#{GEM_VERSION}}
end

desc "Release the version"
task :release do
  version = GEM_VERSION
  puts "Releasing #{version}"

  `git show-ref tags/v#{version}`
  unless $?.success?
    abort "There is no tag for v#{version}"
  end

  `git show-ref heads/releasing`
  if $?.success?
    abort "Remove the releasing branch, we need it!"
  end

  puts "Checking out to the releasing branch as the tag"
  system("git", "checkout", "-b", "releasing", "tags/v#{version}")

  puts "Uploading gem to internal gem server"
  ENV.delete("GEM_PATH")
  %x{ samurai gem_upload #{GEM_NAME} #{version} }

  puts "Reseting back to master"
  system("git", "checkout", "master")
  system("git", "branch", "-d", "releasing")

  ints = Gem::Version.new(version).ints << 0
  next_version = Gem::Version.new(ints.join(".")).bump

  puts "Changing the version to #{next_version}."

  version_file = "#{r.root}/lib/#{GEM_NAME}/version.rb"
  File.open(version_file, "w") do |f|
    f.puts <<-EOT
module Rubundler
  VERSION = "#{next_version}"
end
    EOT
  end

  puts "Committing the version change"
  system("git", "commit", version_file, "-m", "Next version: #{next_version}")

  puts "Push the commit up! if you don't, you'll be hunted down"
end
