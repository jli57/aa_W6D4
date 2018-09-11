# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  num_visits :integer          default(0), not null
#  user_id    :integer          not null
#  short_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord

  validates :short_id, :user_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.create(user_id: user.id, short_id: shortened_url.id)
  end


  belongs_to :visited_url,
  primary_key: :id,
  foreign_key: :short_id,
  class_name: :ShortenedUrl


end
