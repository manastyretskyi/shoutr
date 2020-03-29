class Dashboard
  
  def initialize(user)
    @user = user
  end

  def timeline
    @timeline = Timeline.new timeline_users
  end

  def timeline_users
    [user] + user.followed_users
  end

  private

  attr_reader :user
end