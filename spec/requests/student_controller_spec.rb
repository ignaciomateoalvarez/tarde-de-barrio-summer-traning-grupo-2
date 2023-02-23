require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  before(:each) do
    @user = build(:user)
    login_user
  end

  describe 'GET index' do
    before { get :index }
    it 'Muestra la respuesta HTTP y renderiza la vista' do
      expect(response).to have_http_status(:ok)
      expect(subject).to render_template(:index)
    end
  end

  describe 'GET edit' do
    let(:student) { create(:student) }
    before { get edit_student_path(student.id) }
    it { expect(response).to have_http_status(:ok) }
  end
end