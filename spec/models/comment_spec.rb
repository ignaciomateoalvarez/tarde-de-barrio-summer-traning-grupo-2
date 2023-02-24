require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:user) { build(:user) }
  let(:student) { build(:student) }
  let(:comment) { build(:comment) }

  describe 'Associations' do
    it { should belong_to(:student) }
    it { should respond_to(:student_id) }
  end

end
