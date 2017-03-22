class UserLikes
  attr_reader :name
  def initialize(attrs = {})
    @name = attrs[:name]
  end

  def self.for_user(current_user)
    FacebookService.new(current_user).user_likes.map do |raw_like|
      UserLikes.new(raw_like).name
    end.join(", ")
  end
end
