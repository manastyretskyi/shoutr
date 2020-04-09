require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  describe 'Validation' do
    it 'username should be present' do
      user.username = ''
      expect(user).not_to be_valid
    end

    it 'username should be alphanumeric' do
      user.username = '@#$%^*'
      expect(user).not_to be_valid
      user.username = 'qwerty'
      expect(user).to be_valid
    end

    it 'username should ne unique' do
      other_user.username = user.username
      expect(other_user).not_to be_valid
    end
  end

  describe 'Follow relationships' do
    it 'should be able to follow other users' do
      expect(user.following?(other_user)).to be false
      user.follow other_user
      expect(user.following?(other_user)).to be true
    end

    it 'should not be able to follow himself' do
      expect(user.following?(user)).to be false
      user.follow user
      expect(user.following?(user)).to be false
    end

    it 'should be able to unfollow followed users' do
      user.follow other_user
      expect(user.following?(other_user)).to be true
      user.unfollow other_user
      expect(user.following?(other_user)).to be false
    end
  end

  describe 'Likes relationships' do
    let(:shout) { create(:shout) }

    it 'should be able to like shout' do
      expect(user.liked?(shout)).to be false
      expect(shout.likes.count).to be 0
      user.like shout
      expect(user.liked?(shout)).to be true
      expect(shout.likes.count).to be 1
    end

    it 'should be able to unlike shout' do
      user.like shout
      expect(user.liked?(shout)).to be true
      expect(shout.likes.count).to be 1
      user.unlike shout
      expect(user.liked?(shout)).to be false
      expect(shout.likes.count).to be 0
    end
  end
end
