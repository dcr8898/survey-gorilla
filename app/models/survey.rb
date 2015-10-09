class Survey < ActiveRecord::Base
  has_many   :questions
  has_many   :polls
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true, unique: true, length: { maximum: 50 }
end
