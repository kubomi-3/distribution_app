class Ans1 < ApplicationRecord

  validates :user_id, :subject_id, presence: true

  belongs_to :user
  belongs_to :subject

end
