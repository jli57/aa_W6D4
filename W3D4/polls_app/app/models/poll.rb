# == Schema Information
#
# Table name: polls
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  validates :title, presence: true
  validates :questions, :length => { :minimum => 1 }
  
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User
    
  has_many :questions
end
