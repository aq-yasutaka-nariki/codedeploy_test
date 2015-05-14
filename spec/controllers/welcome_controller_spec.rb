require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do 


  describe 'GET index' do 

    it 'returns http status success' do 
      get :index
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do 
      get :index
      expect(response).to render_template(:index)
    end

  end

end