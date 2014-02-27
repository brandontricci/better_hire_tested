class QuestionsController < ApplicationController
  before_action :find_position

  def create
      @question = @position.questions.new question_params
    if @question.save
      redirect_to @position, notice: "Your question has been added."
    else
      flash.now[:alert] =  "There was an error saving your question."
      redirect_to @position
    end
  end

  def new
    @question = Question.new
  end


  private

  def question_params
    params.require(:question).permit(:title)
  end

  def find_position
    @position = Position.find(params[:position_id])
  end
end    

