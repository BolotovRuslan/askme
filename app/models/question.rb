class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  validates :user, :text, presence: true
  validates :user, :text, length: {maximum: 255}

end
