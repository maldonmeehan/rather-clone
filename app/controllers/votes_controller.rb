class VotesController < ApplicationController

  def create
    @current_user = User.find(params[:current_user])
    @answer = Answer.find(params[:answer_id])
    vote = Vote.new
    vote.profile = current_user.profile
    vote.answer_id = @answer.id
    if vote.save!
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    end
  end

end
