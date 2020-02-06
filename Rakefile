require 'jars/classpath'
require 'jars/installer'
require 'rake/javaextensiontask'

task :install_jars do
  Jars::Installer.vendor_jars!
end

spec = eval File.read('dbm.gemspec')
Rake::JavaExtensionTask.new('dbm', spec) do |ext|
  ext.classpath = Jars::Classpath.new.classpath_string
  ext.ext_dir = 'src/main/java'
end

task default: [:compile, :install_jars]

require 'rubygems/package_task'
Gem::PackageTask.new(spec) do
  desc 'Pack gem'
  task package: [:compile]
end
