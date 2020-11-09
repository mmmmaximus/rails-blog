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

  #for reference on validations
  describe 'validations' do
    subject { Comment.new(commenter: commenter, body: body, article: article) }
    let(:article) { Article.create(title: 'title', text: 'texts') }
    let(:commenter) { 'some commenter' }
    let(:body) { 'some body' }

    context 'commenter is not present' do
      let(:commenter) { nil }

      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'commenter is less then 5 characters' do  
      let(:commenter) { 'four' }

      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'commenter is equal to 5 characters' do  
      let(:commenter) { 'title' }
  
      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'commenter is greater then 5 characters' do  
      let(:commenter) { 'greate' }

      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'body is not present' do
      let(:body) { nil }

      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'body is less then 5 characters' do  
      let(:body) { 'four' }

      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end

    context 'body is equal to 5 characters' do  
      let(:body) { 'title' }
  
      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'body is greater then 5 characters' do  
      let(:body) { 'greate' }

      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end
  end

  describe 'validations with shoulda-matchers' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_length_of(:body).is_at_least(5) }
    it { is_expected.to validate_presence_of(:commenter) }
    it { is_expected.to validate_length_of(:commenter).is_at_least(5) }
  end
end
