#publication_presenter.rb

require 'rails_helper'

RSpec.describe PublicationPresenter do
  describe '#initialize' do
    it 'sets @params to the given params' do
      params = { foo: 'bar' }
      my_class = PublicationPresenter.new(params)
      expect(my_class.instance_variable_get(:@params)).to eq(params)
    end

    it 'calls #setup_posts' do
      expect_any_instance_of(PublicationPresenter).to receive(:setup_posts)
      PublicationPresenter.new({})
    end
  end

  describe '#setup_posts' do
    let(:highlighted_post1) { create(:post, highlight: true, created_at: Date.yesterday) }
    let(:highlighted_post2) { create(:post, highlight: true, created_at: Date.today) }
    let(:not_highlighted_post1) { create(:post, highlight: false, created_at: 2.days.ago) }
    let(:not_highlighted_post2) { create(:post, highlight: false, created_at: 1.day.ago) }

    it 'assigns highlighted posts to @highlighted grouped by created_at date' do
      my_class = PublicationPresenter.new({})
      expect(my_class.highlighted).to eq({
        Date.yesterday => [highlighted_post1],
        Date.today => [highlighted_post2]
      })
    end

    it 'assigns not highlighted posts to @not_highlighted sorted by created_at desc and grouped by created_at date' do
      my_class = PublicationPresenter.new({})
      expect(my_class.not_highlighted).to eq({
        Date.today => [not_highlighted_post2],
        2.days.ago => [not_highlighted_post1]
      })
    end
  end
end
