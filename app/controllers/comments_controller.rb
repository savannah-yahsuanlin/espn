class CommentsController < ApplicationController

	def create
		@message = Message.find(params[:id])
		@comment = @message.comments.create(comment_params)
		@comment.user_id = current_user.user_id

		if @comment.save
			redirect_to @message
		else
			render 'new'
		end 
	end

	private

	def comment_params
		params.require(:comment).permit(:context)
	end
end
