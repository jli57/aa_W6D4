# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :not_duplicate_response, :no_rigging
  
  def not_duplicate_response
    dups = Response
      .joins(:question)
      .where(user_id: user_id, questions: { id: answer_choice.question_id })
    if dups.count > 0
      errors[:respondent] << "already answered this question"
    end
  end
  
  def no_rigging
    if user_id == question.poll.user_id
      errors[:respondent] << "! Don't rig!"
    end 
  end
  
  belongs_to :answer_choice
  
  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: :User
    
  has_one :question,
    through: :answer_choice,
    source: :question
end
