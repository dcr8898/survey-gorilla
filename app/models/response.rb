class Response < ActiveRecord::Base
  belongs_to :poll
  belongs_to :choice

  validates :poll_id, presence: true
  validates :choice_id, presence: true
end
