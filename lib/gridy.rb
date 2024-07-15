require "gridy/version"
require "gridy/railtie"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module Gridy
end
