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
end