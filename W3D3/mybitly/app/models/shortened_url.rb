# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :text             not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, :user_id, presence: true

  def self.random_code
    rando = SecureRandom.urlsafe_base64

    while ShortenedUrl.exists?(['short_url = ?', 'rando'])
      rando = SecureRandom.urlsafe_base64
    end

    rando
  end

  def self.create_shortened_url(user, my_long_url)
    ShortenedUrl.create!(long_url: my_long_url, short_url: ShortenedUrl.random_code, user_id: user.id)
  end

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :visits,
  primary_key: :id,
  foreign_key: :short_id,
  class_name: :Visit

  def num_clicks
    visits.count
  end

  def num_uniques
    uniq_ids = []
    visits.each do |visit|
      uniq_ids << visit.user_id unless uniq_ids.include?(visit.user_id)
    end

    uniq_ids.count
  end

  def num_recent_uniques
    recent_ids = []
    visits.each do |visit|
      unless recent_ids.include?(visit.user_id) || (Time.now - 10.minutes) > created_at
        recent_ids << visit.user_id
      end
    end

    recent_ids.count
  end


end
