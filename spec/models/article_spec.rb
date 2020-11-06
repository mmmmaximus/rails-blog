require 'rails_helper'

describe Article do
  let(:article) { Article.create(title: 'Ben Article Title', text: 'Ben Article Text') }

  # Rspec Documentation: https://github.com/rspec/rspec-rails
  # how to run tests: bundle exec rspec
  # how to run individual test: bundle exec rspec <file_path>
  # copy the filepath from the explorer on the left.

  describe '.title_and_text' do
    false
    # Write whats missing for the test here if there is nothing added this will fail
  end
end
