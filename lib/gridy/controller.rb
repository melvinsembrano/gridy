require "pagy"

module Gridy
  module Controller
    extend ActiveSupport::Concern

    included do
      include Pagy::Backend
    end

    class_methods do

      def gridy_resource(resource)
        @resource = resource
      end

      def resource
        @resource.presence || controller_name.classify.constantize
      end
    end

    def gridy_collection(collection, options = {})
      @pagy, records = pagy(collection, items: options[:items] || 20)
      instance_variable_set("@#{resource_name.pluralize}", records)
    end


    private

    def resource_name
      self.class.resource.name
    end

    def resource_index_url
      send "#{resource_name.underscore.pluralize}_url"
    end

    def resource_instance
      instance_variable_get("@#{resource_name.underscore}")
    end

    def resource_instance=(value)
      instance_variable_set("@#{resource_name.underscore}", value)
    end

  end
end
