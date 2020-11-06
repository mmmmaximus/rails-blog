class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  def reverse_commenter_name
    commenter.reverse
  end

  def article_name_and_commenter_name
    "#{article.title} - #{commenter}"
  end
end
