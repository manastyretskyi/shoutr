module AvatarHelper
  def avatar(user, size: 80, rounded: false)
    email_digest = Digest::MD5.hexdigest(user.email)
    gravatar_url = "//gravatar.com/avatar/#{email_digest}?s=#{size}"
    image_tag gravatar_url, class: "#{"rounded-circle" if rounded}"
  end
end