require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation' do 
    it { is_expected.to validate_presence_of(:first_name) }    
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }   
     
  end
  context 'Factory' do
    it { expect(create(:user)).to be_persisted }
  end
end

  