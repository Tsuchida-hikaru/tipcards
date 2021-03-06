class CardsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @user = User.find(current_user.id) if user_signed_in?
    @cards = Card.includes([:user, card_tag_relations: :tag]).order(updated_at: :DESC).page(params[:page]).per(5)
    @card = CardTag.new
  end

  def create
    @user = User.find(current_user.id)
    @cards = Card.includes(:user).order(updated_at: :DESC).page(params[:page]).per(5)
    @card = CardTag.new(card_params)
    if @card.valid?
      @card.save
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

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where( ['tag LIKE ?', "%#{params[:keyword]}%"] )
    render json: { keyword: tag }
  end

  private

  def card_params
    params.require(:card_tag).permit(:title, :text, :publish_setting, { images: [] }, :tag).merge(user_id: current_user.id)
  end

  def set_card
    @card = Card.find(params[:id])
  end
end
