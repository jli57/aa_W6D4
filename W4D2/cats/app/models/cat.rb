# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: %w(brown black hotpink grey white)}
  validates :sex, inclusion: { in: %w(M F)}

  has_many :rental_requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    Time.now.year - birth_date.year
  end

  def self.cat_colors
    %w(brown black hotpink grey white)
  end

  def over_lapping_requests
    CatRentalRequest.
    Cat.rental_requests
      .where()
  end

end
