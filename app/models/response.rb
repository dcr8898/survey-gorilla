class Response < ActiveRecord::Base
  belongs_to :poll
  belongs_to :choice
  has_one :question, :through => :choice
  has_many :choices, :through => :question

  validates :poll_id, presence: true
  validates :choice_id, presence: true

  def text
    self.choice.text
  end
end
