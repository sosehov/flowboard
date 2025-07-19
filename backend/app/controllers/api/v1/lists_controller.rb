class Api::V1::ListsController < ApplicationController
  before_action :set_board, only: [:index, :create]
  before_action :set_list, only: [:show, :update, :destroy]

  # GET /api/v1/boards/:board_id/lists
  def index
    render json: @board.lists, include: :cards
  end

  # POST /api/v1/boards/:board_id/lists
  def create
    list = @board.lists.build(list_params)
    if list.save
      render json: list, status: :created
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /api/v1/lists/:id
  def show
    render json: @list, include: :cards
  end

  # PATCH/PUT /api/v1/lists/:id
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/lists/:id
  def destroy
    @list.destroy
    head :no_content
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end
end
