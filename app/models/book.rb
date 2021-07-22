class Book < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :opinion
  end
end
