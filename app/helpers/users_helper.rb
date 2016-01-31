module UsersHelper

  def has_posts_or_comments?
    current_user.posts.count > 0 || current_user.comments.count > 0
  end

  

end
