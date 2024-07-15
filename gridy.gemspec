require_relative "lib/gridy/version"

Gem::Specification.new do |spec|
  spec.name        = "gridy"
  spec.version     = Gridy::VERSION
  spec.authors     = ["Melvin Sembrano"]
  spec.email       = ["melv@hey.com"]
  spec.homepage    = "http://github.com/melvinsembrano/gridy"
  spec.summary     = "Ruby on Rails grid helper"
  spec.description = "Ruby on Rails grid made easy"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/melvinsembrano/gridy"
  spec.metadata["changelog_uri"] = "https://github.com/melvinsembrano/gridy/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.4"
end
