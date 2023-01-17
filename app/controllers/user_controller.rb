class UserController < ApplicationController
  # before_action :require_user, only: [:index]
    before_action :authenticate_user!, only: [:index]

  def index
  end

  # private
  # def require_user
  #   unless current_user
  #     redirect_to new_user_session_path
  #   end
  # end
end
