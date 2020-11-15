class CardsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @cards = Card.includes(:user)
    @card = Card.new
  end

  def create
    @cards = Card.includes(:user)
    @card = Card.create(card_params)
    if @card.save
      flash.now[:card_notice] = "カードを投稿しました"
      render action: :index
    else
      flash.now[:card_alert] = "カード投稿に失敗しました"
      render "cards/index"
    end
  end

  def edit
    set_card
  end

  def update
    set_card
    @card.update(card_params)
    if @card.update(card_params)
      redirect_to root_path, flash: { card: "カードを編集しました" }
    else
      flash.now[:card_alert] = "カードの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    set_card
    @card.destroy
    if @card.destroy
      redirect_to root_path, flash: { card_notice: "カードを削除しました" }
    else
      redirect_to root_path, flash: { card_alert: "カードの削除に失敗しました" }
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :text, :image, :publish_setting, images: []).merge(user_id: current_user.id)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
