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
      redirect_to boards_path
    else
      flash.now[:alert] = "Your board was not created!"
      render 'new'
    end
  end

  def show
    @board = current_user.boards&.find(params[:id])
    @messages = @board&.messages
  end

  def edit
    @board = current_user.boards&.find(params[:id])
  end

  def update
    @board = current_user.boards&.find(params[:id])
    @boards = current_user.boards.all

    if @board.update(board_params)
      redirect_to boards_path
    else
      render 'edit'
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy

    if @board.destroy
      respond_to do |format|
        format.html { redirect_to boards_path }
        format.xml  { head :ok }
      end
    end
  end

  private

  def board_params
    params.require(:board).permit(:name)
  end
end