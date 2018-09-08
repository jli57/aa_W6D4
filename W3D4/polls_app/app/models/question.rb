# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  poll_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, presence: true
  validates :questions, :length => { :minimum => 1 }
  
  has_many :answer_choices
  
  belongs_to :poll
  
  has_many :responses,
    through: :answer_choices,
    source: :responses
    
    
  def results
    results_hash = {}
    
    counts = answer_choices.select(:text, "COUNT(responses.id) AS num_responses")
      .left_outer_joins(:responses)
      .group(:id)
    
    counts.each do |item|
      results_hash[item.text] = item.num_responses
    end 
    
    results_hash
      
    
    # ac = answer_choices
    # 
    # ac.each do |choice|
    #   results_hash[choice.text] = choice.responses.count
    # end 
    # 
    # results_hash
  end
end
