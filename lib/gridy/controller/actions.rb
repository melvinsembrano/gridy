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
        gridy_collection(collection, params)
        render "index"
      end

      def show
      end

      def new
        self.resource_instance = resource_class.new
      end

      def edit
      end

      def create
        self.resource_instance = resource_class.new(resource_params)

        if resource_instance.save
          redirect_to resource_instance, notice: "#{resource_name.titleize} was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if resource_instance.update(resource_params)
          redirect_to resource_instance, notice: "#{resource_name.titleize} was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        resource_instance.destroy!
        redirect_to resource_index_url, notice: "#{resource_name.titleize} was successfully destroyed."
      end

      private

      def resource_class
        self.class.resource
      end

      def collection
        resource_class.all
      end

      def set_resource
        self.resource_instance = resource_class.find(params[:id])
      end

      def resource_params
        resource_named_params = "#{resource_name}_params"
        return send(resource_named_params) if respond_to?(resource_named_params)

        params.require(resource_name.underscore.to_sym).permit(*resource_attributes)
      end

    end
  end
end
