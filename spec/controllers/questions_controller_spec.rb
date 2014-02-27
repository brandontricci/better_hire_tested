require "spec_helper"

describe QuestionsController do

  let(:user) { create :user }
  let(:position) { create :position }
  before do
    sign_in user
  end

  describe "GET #new" do
    it "should render new page" do

    end
  end

  describe "POST #create" do
    
    describe "when the question is valid" do      
      before do 
        @valid_question_params = { question: {title: "My Fav Color?" } }
      end

      it "should create a question" do
        post :create, @valid_question_params.merge({position_id: position.id})
        expect(position.questions.count).to eq(1)
      end
    end

    describe "when the question is invalid" do

      it "should not creae a question" do
        invalid_attr = {question: { title: ""} }
        post :create, position_id: position.id, question: invalid_attr
        expect(position.questions.count).to eq(0)
      end
    end
  end
end
  
