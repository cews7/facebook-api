class UserPresenter
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def user_image
    FacebookService.new(current_user).user_image
  end

  def user_likes
    UserLikes.for_user(current_user)
  end

  def user_friends_count
    FacebookService.new(current_user).user_friends_count
  end

  def user_birthday
    FacebookService.new(current_user).user_birthday
  end
end
