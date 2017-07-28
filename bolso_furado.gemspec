Gem::Specification.new do |s|
  s.name        = 'bolso-furado'
  s.version     = '1.0.0'
  s.description = 'Tag your old articles on pocket as "bolso-furado"'
  s.authors     = ['Hercules Lemke Merscher']
  s.email       = 'hlmerscher@gmail.com'
  s.files       = ['lib/bolso_furado.rb', 
                   'lib/cli_options.rb', 
                   'lib/version.rb', 
                   'bin/bolso-furado'
                  ]
  s.executables << 'bolso-furado'
  s.homepage    = 'http://github.com/hlmerscher/bolso-furado'
  s.license     = 'MIT'
end
