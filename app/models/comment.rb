class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }

  def reverse_commenter_name
    # Reverse the commenters name and run the tests
    # /spec/models/comment_spec.rb
  end

  def article_name_and_commenter_name
    # Return the articles name, and the commenters name together.
    # You will need to add an assertion in the test for this one
    # /spec/models/comment_spec.rb
  end
end
