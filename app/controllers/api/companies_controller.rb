class Api::CompaniesController < ApplicationController

    def index
        companies = Company.paginate(page: params[:page], per_page: 10)
        render json: { companies: companies, count: Company.count }    
    end

    def create
        @company = Company.create(company_params)
        if @company 
            render json: @company
        else
            render json: @company.errors.messages
        end
    end

    def show
        company
        if @company 
            render json: @company, serializer: Api::CompanySerializer
        else
            render json: { message: "Page not found" }, status: :not_found
        end
    end

    def update
        company
        company = @company.update(company_params)
        if @company 
            render json: @company
        else
            render json: @company.errors.messages
        end
    end

    def destroy
        company
        company.destroy
    end

    private

    def company
        @company ||= Company.find_by(id: params[:id])
    end

    def company_params
        params.require(:company).permit(:name, :city, :state, :description, :founded_on)
    end

end
