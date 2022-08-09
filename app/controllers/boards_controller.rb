class BoardsController < ApplicationController
  def new
    @board = current_user.boards.new()
  end

  def index
    @boards = current_user.boards.all
    @boards
  end

  def create
    @board = current_user.boards.create(board_params)
    if @board.save
      flash.now[:notice] = "Your board was created!"
      render 'show'
    else
      flash.now[:alert] = "Your board was not created!"
      render 'new'
    end
  end

  def show
    @board = current_user.boards.find(params[:id])
    @messages = @board.messages
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end