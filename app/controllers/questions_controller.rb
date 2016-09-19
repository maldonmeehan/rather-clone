class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
  end

  def create

    @question = Question.new(profile: current_user.profile)
    @question.answers = [
        Answer.new(content: params[:content1]),
        Answer.new(content: params[:content2])
    ]
    if @question.save
      @questions = Question.all
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end

    else
      render :new
    end
  end


  private

  def question_params
    params.require(:profile).permit(:content1, :content2)
  end
end
