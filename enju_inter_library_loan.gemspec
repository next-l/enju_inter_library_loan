$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "enju_inter_library_loan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_inter_library_loan"
  s.version     = EnjuInterLibraryLoan::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_inter_library_loan"
  s.summary     = "enju_inter_library_loan plugin"
  s.description = "Inter library loan management for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids}/*"]

  s.add_dependency "enju_biblio", "~> 0.1.0.pre56"
  s.add_dependency "enju_library", "~> 0.1.0.pre35"
  s.add_dependency "statesman"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.1"
  s.add_development_dependency "sunspot-rails-tester"
  s.add_development_dependency "enju_leaf", "~> 1.1.0.rc14"
  s.add_development_dependency "enju_circulation", "~> 0.1.0.pre38"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "annotate"
end
