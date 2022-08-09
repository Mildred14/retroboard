class MessagesController < ApplicationController
  before_action :set_board
  def new
    @message = @board.messages.build
  end

  def create
    @message = @board.messages.new(message_params)
    @message.author = current_user
    if @message.save
      redirect_to @board
    else
      render :new
    end
  end

  def edit
    @message = @board.messages.find(params[:id])
  end

  def update
    @message = @board.messages.find(params[:id])

    if @message.update(message_params)
      redirect_to @board
    else
      render 'edit'
    end
  end

  private

  def set_board
    @board = current_user.organization.boards.find(params[:board_id])
  end

  def message_params
    params.require(:message).permit(:content, :category)
  end
end