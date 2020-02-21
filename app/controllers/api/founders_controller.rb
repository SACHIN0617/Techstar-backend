class Api::FoundersController < ApplicationController
    def create
        company
        founder = @company.founders.new(founder_params)
        if founder.save
            render json: @company, serializer: Api::CompanySerializer
        else
            render json: { errors: founder.errors.messages }, status: :unprocessable_entity
        end
    end

    private

    def founder_params
        params.require(:founder).permit(:name, :title)
    end

    def company
        @company ||= Company.find_by(id: params[:company_id])
    end

    def founder
        @founder ||= company.founders.find_by(id: params[:id])
    end
    
end
