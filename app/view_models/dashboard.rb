class Dashboard
  
  def initialize(user, page: 1)
    @user = user
    @page = page
  end

  def timeline
    @timeline = Timeline.new timeline_users, page: @page
  end

  def timeline_users
    [user] + user.followed_users
  end

  private

  attr_reader :user
end