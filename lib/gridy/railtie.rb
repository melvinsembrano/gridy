module Gridy
  class Railtie < ::Rails::Engine

    PRECOMPILE_ASSETS = [
      "gridy.css",
      "gridy/open-props.css",
      "gridy/open-props/normalize.css",
      "gridy/open-props/buttons.css"
    ].freeze

    initializer "gridy.assets" do
      if Rails.application.config.respond_to?(:assets)
        Rails.application.config.assets.precompile += PRECOMPILE_ASSETS
      end
    end

    initializer "gridy.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        require "gridy/view_helpers"
        include Gridy::ViewHelpers
      end
    end
  end
end
