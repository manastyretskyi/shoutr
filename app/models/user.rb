class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :trackable, :confirmable
  validates :username, presence: true, uniqueness: true

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  validates :email, presence: true, uniqueness: true

  enum role: %i[user moderator admin]

  has_many :shouts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_shouts, through: :likes, source: :shout

  has_many :followed_user_relationships,
           foreign_key: :follower_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
           foreign_key: :followed_user_id,
           class_name: 'FollowingRelationship',
           dependent: :destroy
  has_many :followers, through: :follower_relationships

  attr_writer :login

  def login
    @login || username || email
  end

  def follow(user)
    followed_users << user unless self == user
  end

  def unfollow(user)
    followed_users.destroy user
  end

  def following?(user)
    followed_user_ids.include? user.id
  end

  def like(shout)
    liked_shouts << shout
  end

  def unlike(shout)
    liked_shouts.destroy shout
  end

  def liked?(shout)
    liked_shout_ids.include? shout.id
  end

  def to_param
    username
  end

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['lower(username) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end
end
