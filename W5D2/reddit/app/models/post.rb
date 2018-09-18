# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :text
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, :user_id, presence: true

  validates :count_subs, numericality: { greater_than: 0}

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :subs,
    through: :post_subs,
    source: :subs

  has_many :post_subs,
    inverse_of: :post,
    dependent: :destroy

  # has_many :post_subs,
  #   foreign_key: :post_id,
  #   class_name: :PostSub

  # belongs_to :sub,
  #   foreign_key: :sub_id,
  #   class_name: :Sub

  def count_subs
    subs.count
  end



  # has_many :posts, through: :post_subs, source: :post
end


# posts table
# post_id sub_id
#
# post_id 2 sub_id 2
# post_id 2 sub_id 4
# post_id 3 sub_id 4
# post_id 2 sub_id 7
