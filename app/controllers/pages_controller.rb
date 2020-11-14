class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :move_to_index, only: :index

  def index
    @cards = Card.includes(:user)
    @card = Card.new
  end
end
