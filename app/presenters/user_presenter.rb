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
end
