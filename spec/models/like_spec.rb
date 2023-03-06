require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { build(:user) }
  let(:comment) { build(:comment) }

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:comment) }
  end
end
