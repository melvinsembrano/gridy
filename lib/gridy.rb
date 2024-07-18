require "gridy/version"
require "gridy/railtie"
require "zeitwerk"
require "turbo-rails"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/generators")

loader.setup

module Gridy
end
