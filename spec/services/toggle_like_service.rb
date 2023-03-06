require 'rails_helper'

RSpec.describe LikesToggleManager, type: :service do
  describe "User likes and dislike comment" do
    let(:user) { FactoryBot.create(:user) }
    let(:comment) { FactoryBot.create(:comment) }

    context "when the user gives like to the comment" do
      it "should add and remove user from likes list" do
        LikesToggleManager.new(user, comment).call
        expect(comment.likes.first.user_id).to be_equal(user.id)
        LikesToggleManager.new(user, comment).call
        expect(comment.likes.first).to be_nil
      end
    end
  end
end
