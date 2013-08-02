Gem::Specification.new do |s|
  s.name = "rack-metadata"
  s.version = "0.0.1"
  s.description = "Add metadata tags to the header"
  s.summary = "Add metadata tags to the html header"
  s.add_dependency "rack"

  s.author = "Jeff Ching"
  s.email = "jeff@chingr.com"
  s.homepage = "http://github.com/chingor13/rack-metadata"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
