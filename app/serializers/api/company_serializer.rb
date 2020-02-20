module Api
    class CompanySerializer < ::ActiveModel::Serializer
        attributes :id, :name, :city, :state, :founded_on,
                :description, :founders
                
        has_many :founders
    end
end
  