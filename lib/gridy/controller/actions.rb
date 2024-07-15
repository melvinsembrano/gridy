require "pagy"

module Gridy
  module Controller
    module Actions
      extend ActiveSupport::Concern

      included do
        include Gridy::Controller
        before_action :set_resource, only: %i[ show edit update destroy ]


        define_method "#{controller_name.singularize}_params" do
          params.require(controller_name.singularize).permit!
        end
      end

      def index
        gridy_collection(collection)
      end

      def show
      end

      def new
        self.resource = resource_class.new
      end

      def edit
      end

      def create
        self.resource = resource_class.new(resource_params)

        if resource.save
          redirect_to resource, notice: "#{controller_name.singularize.titleize} was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if resource.update(resource_params)
          redirect_to resource, notice: "#{controller_name.singularize.titleize} was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        resource.destroy!
        redirect_to resource_index_url, notice: "#{controller_name.singularize.titleize} was successfully destroyed."
      end

      private

      def resource_index_url
        send "#{controller_name}_url"
      end

      def resource_class
        controller_name.classify.constantize
      end

      def resource
        instance_variable_get("@#{controller_name.singularize}")
      end

      def resource=(value)
        instance_variable_set("@#{controller_name.singularize}", value)
      end

      def collection
        resource_class.all
      end

      def set_resource
        self.resource = resource_class.find(params[:id])
      end

      def resource_params
        send "#{controller_name.singularize}_params"
      end

    end
  end
end
