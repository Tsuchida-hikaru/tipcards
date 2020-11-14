class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :move_to_index, except: [:index]

  def index
    @cards = Card.includes(:user)
    @card = Card.new
  end
end
