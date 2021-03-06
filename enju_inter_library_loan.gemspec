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
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids,default,development,test}/*"] - Dir["spec/dummy/tmp/*"]

  s.add_dependency "enju_circulation", "~> 0.5.0.beta.1"

  s.add_development_dependency "enju_leaf", "~> 3.0.0.beta.1"
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.9"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.5"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "annotate"
  s.add_development_dependency "sprockets", "~> 3.7"
end
