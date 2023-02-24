require 'rails_helper'

RSpec.describe StudentsController, type: :request do
  before(:each) do
    @user = build(:user)
    @student = create(:student)
    login_user
  end

  describe 'GET index' do
    before { get students_path }
    it 'Muestra la respuesta HTTP y renderiza la vista' do
      expect(response).to have_http_status(:ok)
      expect(subject).to render_template(:index)
    end
  end

  describe 'GET edit' do
    before { get edit_student_path(id: @student.id) }
    it { expect(response).to have_http_status(:ok) }
  end
end