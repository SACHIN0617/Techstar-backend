class Api::CompaniesController < ApplicationController

    def index
        if (params[:query])
            companies = Company.where("lower(companies.name) LIKE :search", search: "%#{params[:query].downcase}%")
                               .paginate(page: params[:page], per_page: 10)
        else
            companies = Company.paginate(page: params[:page], per_page: 10)
        end
        render json: { companies: companies, count: companies.count }    
    end

    def create
        company = Company.new
        company.assign_attributes(company_params)
        if company.save
            render json: company
        else
            render json: { errors: company.errors.messages }, status: :unprocessable_entity
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
        @company.assign_attributes(company_params)
        if @company.save
            render json: @company
        else
            render json: { errors: @company.errors.messages }, status: :unprocessable_entity
        end
    end

    def destroy
        company
        company.destroy
    end

    # def search
    #     companies = Company.where("companies.name LIKE :search", search: "%#{params[:query]}%")
    #     render json: { companies: companies, count: companies.count }
    # end

    private

    def company
        @company ||= Company.find_by(id: params[:id])
    end

    def company_params
        params.require(:company).permit(:name, :city, :state, :description, :founded_on)
    end

end
