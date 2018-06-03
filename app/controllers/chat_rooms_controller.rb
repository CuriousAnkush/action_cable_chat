class ChatRoomsController < ApplicationController
  def index
    @rooms = ChatRoom.all
  end

  def show
    @room = ChatRoom.includes(:messages).find(params[:id])
    @message = Message.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def new
    @room = ChatRoom.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end

end
