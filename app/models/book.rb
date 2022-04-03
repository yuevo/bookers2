class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites

  with_options presence: true do
    validates :title
    validates :body, length: { maximum: 200 }
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
