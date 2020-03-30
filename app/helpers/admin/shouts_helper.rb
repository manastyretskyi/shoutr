module Admin::ShoutsHelper
  def admin_autolink(text)
    text.
    gsub(/@\w+/) { |mention| link_to(mention, admin_user_path(mention[1..-1])) }.
    gsub(/#\w+/) { |hashtag| link_to(hashtag, hashtag_path(hashtag[1..-1])) }.
    html_safe
  end
end
