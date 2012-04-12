$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feedback_popup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feedback_popup"
  s.version     = FeedbackPopup::VERSION
  s.authors     = ["Levente Bagi"]
  s.email       = ["bagilevi@gmail.com"]
  s.homepage    = "https://github.com/peerpost/feedback_popup"
  s.summary     = "Simple feedback popup for Rails 3 applications."
  s.description = "Simple feedback popup for Rails 3 applications."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.0"

  s.add_development_dependency "sqlite3"
end
