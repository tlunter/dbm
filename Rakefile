require 'jars/classpath'
require 'rake/javaextensiontask'

spec = eval File.read('dbm.gemspec')

desc 'compile src/main/java/** into lib/dbm.jar'
Rake::JavaExtensionTask.new('dbm', spec) do |ext|
  ext.classpath = Jars::Classpath.new.classpath_string
  ext.source_version = '1.7'
  ext.target_version = '1.7'
  ext.ext_dir = 'src/main/java'
end

task default: [:compile]

require 'rubygems/package_task'
Gem::PackageTask.new(spec) do
  desc 'Pack gem'
  task package: [:compile]
end
