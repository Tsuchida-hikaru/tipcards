class CardsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @cards = Card.includes(:user).order(updated_at: :DESC)
    @card = Card.new
  end

  def create
    @cards = Card.includes(:user)
    @card = Card.create(card_params)
    if @card.save
      redirect_to cards_path, flash: { notice: "カードを投稿しました" }
    else
      flash.now[:alert] = "カード投稿に失敗しました"
      render :index
    end
  end

  def edit
    set_card
  end

  def update
    set_card
    if params[:card][:delete_images]
      params[:card][:delete_images].each do |image_id|
        image = @card.images.find(image_id)
        image.purge
      end
    end
    @card.update(card_params)
    if @card.update(card_params)
      flash[:notice] = "カードを編集しました"
      redirect_to action: :index, flash: { notice: "カードを編集しました" }
    else
      flash.now[:alert] = "カードの編集に失敗しました"
      render :edit
    end
  end

  def destroy
    set_card
    @card.destroy
    if @card.destroy
      redirect_to root_path, flash: { notice: "カードを削除しました" }
    else
      flash.now[:alert] = "カード削除に失敗しました"
      render "cards/index"
    end
  end

  private

  def card_params
    params.require(:card).permit(:title, :text, :publish_setting, images: []).merge(user_id: current_user.id)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
