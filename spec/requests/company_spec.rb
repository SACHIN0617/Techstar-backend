describe 'Company API' do
    let(:company) { create_list(:company, 20) }
  
    describe 'GET /api/companies', type: :request do
      context "valid attributes" do
        before do
          get api_companies_path, params: { page: 1 }
        end
  
        it 'returns response matching companies schema' do
          expect(response).to match_response_schema('companies')
        end
      end
    end

    describe 'GET /api/companies/:id', type: :request do
        context "valid attributes" do
          before do
            get api_company_path(company.first.id)
          end
    
          it 'returns response matching company schema' do
            expect(response).to match_response_schema('company')
          end
        end
    end

    describe 'GET /api/companies/:id', type: :request do
        context "valid attributes" do
          before do
            get api_company_path(company.first.id + 1000)
          end
    
          it 'returns 404 in response ' do
            get "api/companies/#{company.lasi.id + 1000}"
            expect(response).to be_not_found
          end
        end
    end

    # describe 'GET /api/companies/:id', type: :request do
    #     context "valid attributes" do
    #       before do
    #         params = {
    #             name: "Leann Strosin", city: "Bellastad", state: "Kansas", founded_on: "2020-02-19", description: "560102"
    #         }
    #         get api_company_path(company.first.id)
    #       end
    
    #       it 'returns response matching company schema' do
    #         expect(response).to match_response_schema('company')
    #       end
    #     end
    # end
end