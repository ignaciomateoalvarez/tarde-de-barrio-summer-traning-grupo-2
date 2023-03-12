require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { build(:user) }
  let(:publication) { build(:publication) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:publication) }
  end
end
