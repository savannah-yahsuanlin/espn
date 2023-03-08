class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :destroy, :update]

	def index
		@messages = Message.all.order('created_at ASC')
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

	private
	def message_params
		params.require(:message).permit(:title, :description)
	end

	def find_message
		@message = Message.find(params[:id])
	end
end
