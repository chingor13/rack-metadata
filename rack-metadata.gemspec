Gem::Specification.new do |s|
  s.name = "rack-metadata"
  s.version = "0.0.2"
  s.description = "Add metadata tags to the header"
  s.summary = "Add metadata tags to the html header"
  s.add_dependency "rack"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "nokogiri"

  s.author = "Jeff Ching"
  s.email = "jeff@chingr.com"
  s.homepage = "http://github.com/chingor13/rack-metadata"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
