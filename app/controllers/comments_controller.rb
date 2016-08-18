class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment: params[:comment])
    comment.user = current_user
    comment.event = Event.find(params[:event_id])
    flash_errors comment unless comment.save
    redirect_to "/events/#{params[:event_id]}"
  end
end
