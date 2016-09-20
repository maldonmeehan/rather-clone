class QuestionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    @questions = Question.all
    @question = Question.new
  end

  # def new
  #   @question = Question.new
  # end

  def create

    @question = Question.new(profile: current_user.profile)
    @question.answers = [
        Answer.new(:content => question_params["content1"]),
        Answer.new(:content => question_params["content2"]),

    ]
    # binding.pry
    if @question.save
      @questions = Question.all
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end

    else
      @questions = Question.all
      respond_to do |format|
        flash[:notice] = "Failed to save new question"
        format.html { redirect_to root_url }
        format.js
      end
    end
  end


  private

  def question_params
    params.permit(:content1, :content2)
  end
end
