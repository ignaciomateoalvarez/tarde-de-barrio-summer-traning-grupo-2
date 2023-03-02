require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:user) { build(:user) }
  let(:comment) { build(:comment) }

  describe 'Associations' do
    it { should belong_to(:comment) }
    it { should belong_to(:user) }
  end

  describe 'Validation' do
    context 'Presence' do
      it { is_expected.to validate_presence_of(:body) }
    end
  end
end
