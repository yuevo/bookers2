class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user

  with_options presence: true do
    validates :title
    validates :body, length: { maximum: 200 }
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def sort_favorites
    today = Time.current.at_end_of_day
    day_last_week = (today - 6.day).at_beginning_of_day
    self.includes(:favorited_users).
      sort { |a, b| 
        b.favorited_users.includes(:favorites).where(created_at: day_last_week...today).size <=> 
        a.favorited_users.includes(:favorites).where(created_at: day_last_week...today).size
      }
  end
end
