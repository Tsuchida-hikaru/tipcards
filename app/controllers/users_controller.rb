class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cards = Card.includes(:user).where(user_id: current_user.id).order(updated_at: :DESC).page(params[:page]).per(5)
  end
end
