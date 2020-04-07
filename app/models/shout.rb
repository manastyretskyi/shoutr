class Shout < ApplicationRecord
  belongs_to :user, counter_cache: :shouts_count
  belongs_to :content, polymorphic: true, dependent: :destroy
  validates :user, presence: true

  has_many :likes, foreign_key: "shout_id", dependent: :destroy

  has_many :users_liked, through: :likes, source: :user

  delegate :username, to: :user
end
