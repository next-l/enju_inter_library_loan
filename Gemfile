source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in enju_inter_library_loan.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.
gem "enju_seed", github: "next-l/enju_seed"
gem "enju_leaf", github: "next-l/enju_leaf"
gem "enju_biblio", github: "next-l/enju_biblio"
gem "enju_library", github: "next-l/enju_library"
gem "enju_message", github: "next-l/enju_message"
gem "enju_circulation", github: "next-l/enju_circulation"
gem "enju_event", github: "next-l/enju_event"
gem "enju_manifestation_viewer", github: "next-l/enju_manifestation_viewer"
gem 'jquery-rails'
gem 'jbuilder'
gem 'rails', '~> 5.2'
group :test do
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
end

# To use debugger
# gem 'debugger'
