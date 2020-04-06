class Timeline

  def initialize(users, scope = Shout, page: 1)
    @users = users
    @scope = scope
    @page = page
  end

  def shouts
    scope.where(user_id: users).order(created_at: :desc).paginate(page: @page)
  end

  def to_partial_path
    "timelines/timeline"
  end

  attr_reader :users, :scope
end