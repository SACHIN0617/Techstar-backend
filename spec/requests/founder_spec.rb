describe 'Company API' do 
  let(:company) { create(:company) }
  describe 'Post /api/companies/:company_id/founder/:id', type: :request do
    let(:params) do
      {
        founder:  {
          name: Faker::Company.name,
          title: "CEO"
        }
      }
    end

    context "valid attributes" do
      before do
        post api_company_founders_path(company_id: company.id), params: params
      end

      it 'creates record in database & returns 200' do
        expect(response).to be_successful
      end

      it 'returns response matching company schema' do
        expect(response).to match_response_schema('company_create')
      end

      it 'returns updated parameters' do
        created_founder = Founder.last
        expect(created_founder.name).to eq(params[:founder][:name])
        expect(created_founder.title).to eq(params[:founder][:title])
      end
    end
  end

  describe 'Post /api/companies with wrong parameter', type: :request do
    context "valid attributes" do
      before do
        params = {
            founder:  {
                name: nil,
                title: nil
            }
        }
        post api_company_founders_path(company_id: company.id), params: params
      end

      it 'creates record in database & returns 200' do
        expect(response.status).to eq(422)
      end
    end
  end
end