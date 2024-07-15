require "pagy"

module Gridy
  module Controller
    extend ActiveSupport::Concern

    included do
      include Pagy::Backend
    end

    def gridy_collection(collection, options = {})
      @pagy, records = pagy(collection, items: options[:items] || 20)
      instance_variable_set("@#{controller_name}", records)
    end

  end
end
