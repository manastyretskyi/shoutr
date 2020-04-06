module UsersHelper
  def follow_button(user)
    if current_user.following? user
      button_to "Unfollow", unfollow_user_path, method: :delete, class: "btn btn-secondary btn-block"
    else
      button_to user.following?(current_user) ? "Follow back" : "Follow", follow_user_path, class: "btn btn-primary btn-block"
    end
  end

  def num_to_follows(num)
    number_to_human num, units: :follows, separator: num > 999 ? "." : "", locale: :en
  end
end
