class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :text, presence: true

  def title_and_text
    "#{title} - #{text}"
  end
end
