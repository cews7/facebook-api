class LikesController < ApplicationController
  def index
    @presenter = UserPresenter.new(current_user)
  end
end
