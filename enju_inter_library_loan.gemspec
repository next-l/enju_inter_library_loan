$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_inter_library_loan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_inter_library_loan"
  s.version     = EnjuInterLibraryLoan::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["tanabe@mwr.mediacom.keio.ac.jp"]
  s.homepage    = "https://github.com/nabeta/enju_inter_library_loan"
  s.summary     = "enju_inter_library_loan plugin"
  s.description = "Inter library loan management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "state_machine"
  s.add_dependency "enju_biblio", "~> 0.1.0.pre10"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.0.0.pre.120925"
end
