require "gridy/version"
require "gridy/railtie"
require "zeitwerk"
require "turbo-rails"

loader = Zeitwerk::Loader.for_gem
loader.setup

module Gridy
end
