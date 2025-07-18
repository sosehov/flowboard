class Api::V1::BoardsController < ApplicationController
  def index
    boards = Board.all
    render json: boards
  end

  def show
    board = Board.find(params[:id])
    render json: board, include: :lists
  end

  def create
    board = Board.new(board_params)
    render json: board, status: :created
    else
      render json: { errors: board.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    board = Board.find(params[:id])
    if board.update(board_params)
      render json: board
    else
      render json: { errors: board.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    head :no_content
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
