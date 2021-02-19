class Subject < ApplicationRecord

  validates :title, :user_id,  presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :ans_1s, dependent: :destroy
  has_many :ans_2s, dependent: :destroy
  has_many :ans_3s, dependent: :destroy

  def self.search(search)
    if search != ""
      Subject.where('title LIKE(?)', "%#{search}%")
    else
      Subject.all
    end
  end

end
