require "ransack"

module Gridy
  module Model
    extend ActiveSupport::Concern

    class_methods do
      def searchable_attributes
        column_names.select { |field| attributes_builder.types[field.to_s].type.eql?(:string) }
      end

      def searchable_key
        searchable_attributes.join("_or_") + "_cont"
      end

      def sortable_attributes
        column_names
      end

      def ransackable_attributes(auth_object = nil)
        searchable_attributes
      end

      def ransortable_attributes(auth_object = nil)
        sortable_attributes
      end

      def ransackable_associations(auth_object = nil)
        []
      end
    end
  end
end
