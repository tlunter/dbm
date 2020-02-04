require 'bundler'
Bundler::GemHelper.install_tasks

task :default => [:build_artifact]

task :build_artifact do
  system "mvn package"
  cp "target/dbm.jar", "lib/."
end
