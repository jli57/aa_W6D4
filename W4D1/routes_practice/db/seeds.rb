# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(username: 'ninjasInPajamas')
User.create(username: 'C9')
User.create(username: 'TSM')

Artwork.create(title: 'BLUE', image_url: 'blue.com', artist_id: 1)
Artwork.create(title: 'Clouds', image_url: 'c9.com', artist_id: 2)
Artwork.create(title: 'Shr0ud', image_url: 'cloud9.com', artist_id: 2)
Artwork.create(title: 'Get_carried_bruh', image_url: 'tsm.com', artist_id: 3)

ArtworkShare.create(artwork_id: 2, viewer_id: 1)
ArtworkShare.create(artwork_id: 3, viewer_id: 1)
ArtworkShare.create(artwork_id: 1, viewer_id: 1)
ArtworkShare.create(artwork_id: 3, viewer_id: 2)
