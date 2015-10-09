class User < ActiveRecord::Base
  has_many :surveys
  has_many :polls

  validates :username, presence: true, unique: true, length: { maximum: 50 }
end
