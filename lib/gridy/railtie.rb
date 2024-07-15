module Gridy
  class Railtie < ::Rails::Railtie

    initializer "gridy.add_view_paths" do
      views = File.expand_path("../../app/views", __dir__)
      ActiveSupport.on_load(:action_controller) { prepend_view_path(views) }
    end

  end
end
