class CardsController < ApplicationController
  before_action :move_to_index, except: [:show]

  def create
    card = Card.create(card_params)
    if card.save
      redirect_to root_path, flash: { card_post: "カードを投稿しました" }
    else
      redirect_to root_path, flash: { card_post: "カード投稿に失敗しました" }
    end

  end

  def edit
  end

  def update
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    if card.destroy
      redirect_to root_path, flash: { card_delete: "カードを削除しました" }
    else
      redirect_to root_path, flash: { card_delete: "カードの削除に失敗しました" }
  end

  private

  def card_params
    params.require(:card).permit(:title, :text, :image, :publish_setting).merge(user_id: current_user.id)
  end
end
