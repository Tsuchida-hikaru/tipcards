class CardsController < ApplicationController
  def create
    card = Card.create(card_params)
    redirect_to root_path if card.save
  end

  def edit
  end

  def update
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    redirect_to root_path
  end

  private

  def card_params
    params.require(:card).permit(:title, :text, :image, :publish_setting).merge(user_id: current_user.id)
  end
end
