class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :post

  belongs_to :parent,
    foreign_key: :parent_id,
    class_name: :Comment,
    optional: true

  has_many :children,
    foreign_key: :parent_id,
    class_name: :Comment



end
