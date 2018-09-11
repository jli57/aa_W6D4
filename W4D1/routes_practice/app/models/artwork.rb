# == Schema Information
#
# Table name: artworks
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  image_url :string
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :title, :artist_id, presence: true
  validates :image_url, presence: true, uniqueness: true
  validate :unique_artworks

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :views,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :views,
    source: :viewer

  def unique_artworks
    Artwork.where(artist_id: self.artist_id, title: self.title).empty?
  end
end
