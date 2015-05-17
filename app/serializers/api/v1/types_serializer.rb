module Api
  module V1
    class TypesSerializer < ActiveModel::Serializer
      attributes :id, :name
    end
  end
end
