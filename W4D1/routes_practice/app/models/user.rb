# == Schema Information
#
# Table name: users
#
#  id       :bigint(8)        not null, primary key
#  username :string
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :shares,
    foreign_key: :artist_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork





end
