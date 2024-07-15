require "pagy"

module Gridy
  module Controller
    module Actions
      extend ActiveSupport::Concern

      included do
        include Gridy::Controller
        before_action :set_resource, only: %i[ show edit update destroy ]


        define_method "#{resource_name}_params" do
          params.require(resource_name).permit!
        end
      end

      def index
        gridy_collection(collection)
        render "index"
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
          redirect_to resource, notice: "#{resource_name.titleize} was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end

      def update
        if resource.update(resource_params)
          redirect_to resource, notice: "#{resource_name.titleize} was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        resource.destroy!
        redirect_to resource_index_url, notice: "#{resource_name.titleize} was successfully destroyed."
      end

    end
  end
end
