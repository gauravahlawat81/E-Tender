class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.sender_id = current_user.id
    respond_to do |format|
      if @conversation.save
        format.html { redirect_to conversations_path, notice: 'Conversation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to conversations_path, notice: 'Conversation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:title, :body,:receiver_id,:type_of_message,:remark,:nominee )
    end
end
