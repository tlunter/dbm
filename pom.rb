project 'jruby-dbm' do

  model_version '4.0.0'
  id 'org.jruby:jruby-dbm:0.5'
  packaging 'jar'

  description 'JRuby DBM'

  developer 'tlunter' do
    name 'Todd Lunter'
    email 'tlunter@gmail.com'
    roles 'developer'
  end

  issue_management 'https://github.com/jruby/dbm/issues', 'Github'

  source_control(
    url: 'https://github.com/jruby/dbm',
    connection: 'scm:git:git://github.com/jruby/dbm.git',
    developer_connection: 'git@github.com:jruby/dbm.git'
  )

  properties(
    'maven.compiler.source' => '1.7',
    'maven.compiler.target' => '1.7',
    'source.directory' => 'src/main/java', # poxy Eclipse folders
    'project.build.sourceEncoding' => 'utf-8',
    'polyglot.dump.pom' => 'pom.xml',
    'jruby.api' => 'http://jruby.org/apidocs/',
  )

  jar 'org.jruby:jruby:9.2.9.0'
  jar 'org.mapdb:mapdb:3.0.8'

  plugin_management do
    plugin :resources, '2.6'
    plugin :dependency, '2.8'
    plugin(
      :compiler, '3.5.1',
      source: '${maven.compiler.source}',
      target: '${maven.compiler.target}'
    )
    plugin(
      :javadoc, '2.10.4',
      detect_offline_links: 'false',
      links: ['${jruby.api}']
    )
    plugin(
      :jar, '3.0.2',
      archive: {
        manifestFile: 'MANIFEST.MF' # camel case reqd
      }
    )
  end

  build do
    default_goal 'package'
    source_directory '${source.directory}'
    final_name 'dbm'
  end
end
