RSpec.describe Api::V1::CategoriesController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'GET /api/v1/categories' do
    
    before do
      category_list = [
        "Politics",
        "Opinion",
        "Tech",
        "Science",
        "Health",
        "Sport",
        "Arts",
        "Books",
        "Style",
        "Food",
        "Travel",
        "Real Estate"
      ]
      category_list.each do |name|
        FactoryBot.create(:category, name: name )
      end
    end

    it 'returns a collection of categories' do
      get '/api/v1/categories', headers: headers
      expect(json_response['data'].length).to eq 12
    end
    

    it 'returns 200 response' do
      get '/api/v1/categories', headers: headers
      expect(response.status).to eq 200
    end
  end
end
