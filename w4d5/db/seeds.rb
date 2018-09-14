# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.destroy_all

  users = User.create([
    {email: "austin@email.com", password: "password"},
    {email: "steve@email.com", password: 'football'}
    ])
  Band.destroy_all

  bands = Band.create([
    {name: "Death Cab For Cutie"},
    {name: "Glass Animals"},
    {name: "DMX"},
    {name: "Led Zepplin"}
    ])
  Album.destroy_all

  albums = Album.create([
    {title: "Led Zepplin 1", band_id: bands.last.id, yr: 1971, live: false},
    {title: "Led Zepplin 2", band_id: bands.last.id, yr: 1974, live: false},
    {title: "Thank You For Today", band_id: bands.first.id, yr: 2018, live: false}
    ])

  Track.destroy_all

  tracks = Track.create([
    {title: 'Ramble On', album_id: albums.first.id, ord: 1},
    {title: 'Kashmir', album_id: albums.first.id, ord: 1},
    {title: 'Houses of the Holy', album_id: albums[1].id, ord: 1},
    {title: 'Stairway to Heaven', album_id: albums[1].id, ord: 1}
    ])


end
