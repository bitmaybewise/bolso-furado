require "./lib/version"

Gem::Specification.new do |s|
  s.required_ruby_version = ">= 2.0"
  s.name                  = 'bolso-furado'
  s.version               = VERSION
  s.summary               = 'Tag your old articles on Pocket as "bolso-furado"'
  s.description           = s.summary
  s.authors               = ['Hercules Lemke Merscher']
  s.email                 = 'hlmerscher@gmail.com'
  s.files                 = `git ls-files`.split("\n")
                                          .delete_if { |entry| entry.start_with?(".", "bin") }
  s.executables           = `git ls-files -- bin/*`.split("\n")
                                                   .map {|f| File.basename(f) }
  s.homepage              = 'http://github.com/hlmerscher/bolso-furado'
  s.license               = 'MIT'
end
