add_source "http://gems.rubyforge.org/"

add_gem 'rspec', '=1.1.11'
add_gem 'rake'
add_gem 'rcov'
add_gem 'mongrel'
add_gem 'hoe'

add_dependency 'extlib', '=0.9.8', :require => 'extlib'
add_dependency 'merb-core', '=1.0', :require => 'merb-core'
add_dependency 'merb-gen', '=1.0'
add_dependency 'merb-param-protection', '=1.0', :require => 'merb-param-protection'

add_dependency 'nokogiri', '>=1.0.6'
add_dependency 'webrat', '=0.3.2'
