class Choice < ActiveRecord::Base
  belongs_to :question
  has_many   :responses

  validates :question_id, presence: true
  validates :text, presence: true, length: { maximum: 255 }
end
