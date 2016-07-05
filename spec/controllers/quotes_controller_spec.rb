require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  describe 'quotes#create' do
    it 'requires a logged in user' do
      post :create, quote: {quote: 'malesh'}
      expect(response).to redirect_to new_user_session_path
    end

    it 'creates a quote in the database' do
      u = FactoryGirl.create(:user)
      sign_in u
      post :create, quote: {quote: 'boosh', author: 'ethan'}
      expect(response).to redirect_to root_path
      q = Quote.last
      expect(q.quote).to eq 'boosh'
    end

    it 'properly deals with validation errors' do
      u = FactoryGirl.create(:user)
      sign_in u
      post :create, quote: {quote: ''}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Quote.count).to eq 0
    end

  end


  describe 'quotes#new' do
    it 'should require to log in' do
      post :create, quote: {quote: 'malesh'}
      expect(response).to redirect_to new_user_session_path
    end

    it 'shows the new form for a logged in user' do
      u = FactoryGirl.create(:user)
      sign_in u
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'quotes#show' do
    it 'displays a quote' do
      q = FactoryGirl.create(:quote)
      get :show, id: q.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'quotes#random' do
    it 'displays a quote' do
      q = FactoryGirl.create(:quote)
      get :random
      expect(response).to have_http_status(:success)
    end
  end
end
