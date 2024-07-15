require "pagy"

module Gridy
  module Controller
    module Actions
      extend ActiveSupport::Concern

      included do
        include Gridy::Controller
        before_action :set_resource, only: %i[ show edit update destroy ]
      end

      def index
        gridy_collection(collection)
      end

      private

      def resource_class
        controller_name.classify.constantize
      end

      def collection
        resource_class.all
      end

      def set_resource
        instance_variable_set("@#{controller_name.singularize}", resource_class.find(params[:id]))
      end

    end
  end
end
