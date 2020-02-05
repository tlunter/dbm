# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

files = `git ls-files -- lib/* spec/* sample/*`.split("\n")

Gem::Specification.new do |s|
  s.name        = 'dbm'
  s.version     = '0.5'
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Thomas E. Enebo'
  s.email       = 'tom.enebo@gmail.com'
  s.homepage    = 'http://github.com/jruby/dbm'
  s.summary     = %q{DBM extension}
  s.description = %q{DBM extension}
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
  s.platform = 'java'

  s.files = Dir['lib/**/*.rb']
  s.files += Dir['lib/*.jar']
  s.files += Dir['*.file']
  s.files += Dir['*.gemspec']

  s.requirements << "jar 'org.mapdb:mapdb', '3.0.8'"

  s.add_runtime_dependency 'jar-dependencies'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rake-compiler'
end
