module Gridy
  class Railtie < ::Rails::Engine

    initializer "gridy.add_view_paths" do
      views = File.expand_path("../../app/views", __dir__)
      ActiveSupport.on_load(:action_controller) { prepend_view_path(views) }
    end

    PRECOMPILE_ASSETS = %w[gridy.css].freeze
    initializer "gridy.assets" do
      Rails.application.config.assets.precompile += PRECOMPILE_ASSETS
    end

    initializer "gridy.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        require "gridy/view_helpers"
        include Gridy::ViewHelpers
      end
    end

  end
end
