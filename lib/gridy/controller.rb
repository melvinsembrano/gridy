require "pagy"

module Gridy
  module Controller
    extend ActiveSupport::Concern

    included do
      include Pagy::Backend
      # append gem view path

    end

    class_methods do
      def resource_name
        controller_name.singularize
      end
    end

    def gridy_collection(collection, options = {})
      @pagy, records = pagy(collection, items: options[:items] || 20)
      instance_variable_set("@#{controller_name}", records)
    end


    private

    def resource_name
      self.class.resource_name
    end

    def resource_index_url
      send "#{resource_name.pluralize}_url"
    end

    def resource_class
      resource_name.classify.constantize
    end

    def resource
      instance_variable_get("@#{resource_name}")
    end

    def resource=(value)
      instance_variable_set("@#{resource_name}", value)
    end

    def collection
      resource_class.all
    end

    def set_resource
      self.resource = resource_class.find(params[:id])
    end

    def resource_params
      send "#{resource_name}_params"
    end

  end
end
