class Guest
  def email
    false
  end

  def liked?(_)
    false
  end

  def following?(_)
    false
  end

  def admin?
    false
  end

  def moderator?
    false
  end

  def user?
    false
  end

  def guest?
    true
  end

end