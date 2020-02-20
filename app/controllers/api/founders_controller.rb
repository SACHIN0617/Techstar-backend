class Api::FoundersController < ApplicationController
    def create
        company
        founder = @company.founders.create(founder_params)
        if founder
            render json: @company, serializer: Api::CompanySerializer
        else
            render json: founder.errors.messages
        end
    end

    def update
        founder
        render json: @founder.update(founder_params)
    end

    def destroy
        founder
        render json: @founder.destroy
    end

    def show
        render json: founder
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
