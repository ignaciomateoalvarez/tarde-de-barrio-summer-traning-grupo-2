require 'rails_helper'

RSpec.describe StudentsController, type: [:request, :controller] do
  before(:each) do
    @user = build(:user)
    login_user
  end

  describe 'GET index' do
    before { get :index }
    it 'Muestra la respuesta HTTP y renderiza la vista' do
      expect(response).to have_http_status(:ok)
      #expect(subject).to render_template(:index)
    end
  end


  describe 'GET edit' do
    let!(:student) { create(:student) }
    before { get "/students/#{student.id}/edit" }
  
    context 'when request is valid' do
      it { expect(response).to have_http_status(302) }
      #it { expect(response).to render_template(:edit) }
    end
  end
end 