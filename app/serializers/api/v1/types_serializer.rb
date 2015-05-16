module Api
  module V1
    class TypesSerializer < ActiveModel::Serializer

      attributes :name

      private

      def name
        object[:type]
      end

    end
  end
end
