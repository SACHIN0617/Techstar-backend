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

    describe 'GET /api/companies/:id Invalid Id', type: :request do
        context "valid attributes" do
          before do
            get api_company_path(company.first.id + 1000)
          end
    
          it 'returns 404 in response ' do
            expect(response).to be_not_found
          end
        end
    end

    describe 'Post /api/companies', type: :request do
      let(:params) do
        {
          company:  {
            name: Faker::Company.name,
            city: Faker::Address.city,
            state: Faker::Address.state,
            founded_on: Date.today - 1.days,
            description: "Lorem ipsum"
          }
        }
      end

      context "valid attributes" do
        before do
          post api_companies_path, params: params
        end
  
        it 'creates record in database & returns 200' do
          expect(response).to be_successful
        end

        it 'returns response matching company schema' do
          expect(response).to match_response_schema('company_create')
        end

        it 'returns updated parameters' do
          created_company = Company.last
          expect(created_company.name).to eq(params[:company][:name])
          expect(created_company.city).to eq(params[:company][:city])
          expect(created_company.state).to eq(params[:company][:state])
        end
      end
    end

    describe 'Post /api/companies with wrong parameter', type: :request do
      context "valid attributes" do
        before do
          params = {
            company: {
              name: nil,
              city: nil,
              state: nil,
              founded_on: Date.today - 1.days,
              description: "Lorem ipsum"
            }
          }
          post api_companies_path, params: params
        end
  
        it 'creates record in database & returns 200' do
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'PUT /api/company/:id', type: :request do
      let(:params) do
        {
          company:  {
            name: Faker::Company.name,
            city: Faker::Address.city,
            state: Faker::Address.state,
            founded_on: Date.today - 1.days,
            description: "Lorem ipsum"
          }
        }
      end

      context "valid attributes" do
        before do
          put api_company_path(company.last.id), params: params
        end
  
        it 'creates record in database & returns 200' do
          expect(response).to be_successful
        end

        it 'returns response matching company schema' do
          expect(response).to match_response_schema('company_create')
        end

        it 'returns updated parameters' do
          updated_company = Company.last
          expect(updated_company.name).to eq(params[:company][:name])
          expect(updated_company.city).to eq(params[:company][:city])
          expect(updated_company.state).to eq(params[:company][:state])
        end
      end
    end

    describe 'PUT /api/company/:id', type: :request do
      context "valid attributes" do
        before do
          params = {
            company: {
              name: nil,
              city: nil,
              state: nil,
              founded_on: Date.today - 1.days,
              description: "Lorem ipsum"
            }
          }
          put api_company_path(company.last.id), params: params
        end
  
        it 'creates record in database & returns 422' do
          expect(response.status).to eq(422)
        end
      end
    end

    describe 'DELETE /api/company/:id', type: :request do
      context "valid attributes" do
        before do
          delete api_company_path(company.last.id), params: { page: 1 }
        end
  
        it 'creates record in database & returns 200' do
          expect(response).to be_successful
        end

        it 'deletes the record' do
          deleted_company = Company.find_by(id: company.last.id)
          expect(deleted_company).to eq(nil)
        end
      end
    end
end