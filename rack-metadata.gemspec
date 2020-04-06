Gem::Specification.new do |s|
  s.name = "rack-metadata"
  s.version = "0.0.3"
  s.description = "Add metadata tags to the header"
  s.summary = "Add metadata tags to the html header"
  s.add_dependency "rack"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "nokogiri"

  s.author = ["Jeff Ching", "Jimmy Ngu"]
  s.email = ["jeff@chingr.com", "me@jimmyngu.com"]
  s.homepage = "http://github.com/chingor13/rack-metadata"
  s.license = "MIT"

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
