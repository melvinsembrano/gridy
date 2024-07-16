require "pagy"

module Gridy
  module Controller
    extend ActiveSupport::Concern

    included do
      include Pagy::Backend

      helper_method :resource_attributes_types, :resource_attributes, :resource_name

    end

    class_methods do

      def gridy(options)
        options.symbolize_keys!
        @resource = options[:model] if options[:model].present?
        @resource_attributes = options[:attributes] if options[:attributes].present?
      end

      def resource
        @resource.presence || controller_name.classify.constantize
      end

      def resource_attributes_types
        resource.attributes_builder.types
      end

      def resource_attributes
        @resource_attributes.presence || resource_attributes_types.keys
      end

    end

    def gridy_collection(collection, options = {})
      @pagy, @records = pagy(collection, items: options[:items] || 20)
      instance_variable_set("@#{resource_name.pluralize.underscore}", @records)
    end

    private

    def resource_attributes_types
      self.class.resource_attributes_types
    end

    def resource_attributes
      self.class.resource_attributes
    end

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
      @resource = value
      instance_variable_set("@#{resource_name.underscore}", @resource)
    end

  end
end
