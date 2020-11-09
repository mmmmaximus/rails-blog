require 'rails_helper'

describe Article do
  let(:article) { Article.create(title: 'Ben Article Title', text: 'Ben Article Text') }

  # Rspec Documentation: https://github.com/rspec/rspec-rails
  # how to run tests: bundle exec rspec
  # how to run individual test: bundle exec rspec <file_path>
  # copy the filepath from the explorer on the left.

  describe '.title_and_text' do
    subject { article.title_and_text }

    it 'combines title and text' do
      expect(subject).to eq('Ben Article Title - Ben Article Text')
    end
  end

  #for reference on validations
  describe 'validations' do
    subject { Article.new(title: title, text: text) }
    let(:title) { 'some title' }
    let(:text) { 'some text' }
   
    context 'tile is not present' do
      let(:title) { nil }

      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end
   
    context 'title is less then 5 characters' do  
      let(:title) { 'four' }

      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end
      
    context 'title is equal then 5 characters' do  
      let(:title) { 'title' }
  
      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'title is greater then 5 characters' do  
      let(:title) { 'greate' }

      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end
   
    context 'text is not present' do  
      let(:text) { nil }
   
      it 'is not valid' do
        expect(subject.valid?).to eq(false)
      end
    end
    
    context 'text is less then 5 characters' do  
      let(:text) { 'text' }

      it 'is not valid' do
        expect(subject.valid?).to eq(true)
      end
    end
  end

  describe 'validations with shoulda-matchers' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(5) }
    it { is_expected.to validate_presence_of(:text) }
  end
end