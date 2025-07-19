class Api::V1::CardsController < ApplicationController
  before_action :set_list, only: [:index, :create]
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /api/v1/lists/:list_id/cards
  def index
    render json: @list.cards
  end

  # POST /api/v1/lists/:list_id/cards
  def create
    card = @list.cards.build(card_params)
    if card.save
      render json: card, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/cards/:id
  def show
    render json: @card
  end

  # PATCH/PUT /api/v1/cards/:id
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description)
  end
end
