require 'rails_helper'

describe 'Glossaries Api',type: :request do
    describe 'GET /glossaries' do
        before do
            FactoryBot.create(:glossary, source_code_lang: "EN",target_lang_code:"FR")
            FactoryBot.create(:glossary, source_code_lang: "FR",target_lang_code:"FR")
        end
        it 'returns all books' do
            get '/api/v1/glossaries'
            expect(response).to have_http_status(:success)
            expect(JSON.parse(response.body).size).to eq(3)
        end
    end
    describe 'POST /glossaries' do
        it 'create a new glossary' do
            expect {
                post '/api/v1/glossaries',params: {glossary: { source_code_lang: "EN",target_lang_code:"FR"}}
            }.to change { Glossary.count }.from(0).to(1)
            
            expect(response).to have_http_status(:success)
        end
    end
    describe 'DELETE /glossaries/:id' do
        it 'deletes a glossary ' do
            glossary = FactoryBot.create(:glossary, source_code_lang: "FR",target_lang_code:"FR")
            delete "/api/v1/glossaries/#{glossary.id}"
            expect(response).to have_http_status(:ok)
        end
    end
end 
