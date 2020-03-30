class Like < ApplicationRecord
  belongs_to :user
  belongs_to :shout, counter_cache: :likes_count

  validates :user_id, uniqueness: { scope: :shout_id }
end
