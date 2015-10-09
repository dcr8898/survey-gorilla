class User < ActiveRecord::Base
  has_many :surveys
  has_many :polls

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
end
