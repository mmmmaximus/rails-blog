class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true

  def title_and_text
    # Combine the title and text together in here
    # and then write a test for them here: /spec/models/article_spec.rb
  end
end
