require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }

  context 'Validation' do 
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end
  
  context 'format' do
    it { is_expected.not_to allow_value("nicolas123").for(:first_name) }
    it { is_expected.to allow_value("nicolas").for(:first_name) }
    it { is_expected.not_to allow_value("gar123").for(:last_name) }
    it { is_expected.to allow_value("garci").for(:last_name) }
    it { is_expected.not_to allow_value("gar%").for(:last_name) }
    it { is_expected.to allow_value("email@example.com").for(:email) }
    it { is_expected.not_to allow_value("not_an_email").for(:email) }
  end

  context 'Uniqueness validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context 'Factory' do
    it { expect(create(:user)).to be_persisted }
  end
end