require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:user) { build(:user) }
  let(:publication) { build(:publication) }

  describe 'Associations' do
    it { should belong_to(:publication) }
    it { should belong_to(:user) }
  end

  describe 'Validation' do
    context 'Presence' do
      it { is_expected.to validate_presence_of(:body) }
    end
  end
end
