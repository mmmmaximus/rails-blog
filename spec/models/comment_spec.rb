require 'rails_helper'

describe Comment do
  let(:comment) { Comment.create(commenter: 'max', body: 'hello max', article: article) }
  let(:article) { Article.create(title: 'ben title', text: 'blah') }
  # Rspec Documentation: https://github.com/rspec/rspec-rails
  # how to run tests: bundle exec rspec
  # how to run individual test: bundle exec rspec <file_path>
  # copy the filepath from the explorer on the left.

  describe '.reverse_commenter_name' do
    subject { comment.reverse_commenter_name }

    it 'reverses the commenters name' do
      expect(subject).to eq('xam')
    end
  end

  describe '.article_name_and_commenter_name' do
    subject { comment.article_name_and_commenter_name }

    it 'merges the articles name and commenters name together' do
      expect(subject).to eq('ben title - max')
    end
  end
end
