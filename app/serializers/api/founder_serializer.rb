module Api
    class FounderSerializer < ::ActiveModel::Serializer
        attributes :name, :title
                
        belongs_to :company
    end
end
  