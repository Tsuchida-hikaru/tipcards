class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_cards = Card.includes(:user).where(user_id: current_user.id).order(updated_at: :DESC)
  end
end
