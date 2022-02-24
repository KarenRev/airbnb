require 'faker'
require "open-uri"

puts 'Cleaning up BookingDB'
Booking.destroy_all

puts 'Cleaning up OfferDB'
Offer.destroy_all

puts 'Cleaning up UserDB'
User.destroy_all

User.create!(id: 1, first_name: "a", last_name: "b", email: "a@a.b", password: "123456")
User.create!(id: 2, first_name: "c", last_name: "d", email: "c@d.d", password: "123456")

photos = ['https://www.warble-entertainment.com/blog/wp-content/uploads/2019/10/How-much-do-musicians-cost.jpg', 'https://musicindustryhowtoimages.s3.amazonaws.com/wp-content/uploads/2019/09/24183938/become-musician.jpg', 'https://s18670.pcdn.co/wp-content/uploads/Famous-Musicians-for-Kids.jpg', 'https://www.royalnavy.mod.uk/-/media/careers-section-redesign/homepage/roles-and-specialisations/services/marines/musician/roledetail_videoposter_647x364-assets/647x364_musician.jpg?h=364&w=647&rev=0124080e27394453b053e23bb219b652&cropregion=&hash=997DFA126796BE9EB2DB4FA04EC6A8AA', 'https://www.music.northwestern.edu/sites/default/files/2018-07/hire_musician.jpg', 'https://smallbiztrends.com/ezoimgfmt/media.smallbiztrends.com/2017/03/shutterstock_402500896-850x476.jpg?ezimgfmt=ng%3Awebp%2Fngcb12%2Frs%3Adevice%2Frscb12-2', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/A_musician_playing_violin_4.jpg/1280px-A_musician_playing_violin_4.jpg']

20.times do
  new_offer = Offer.new(
    name: Faker::Music::RockBand.name,
    role: Faker::Music.genre,
    instagram_link: ['https://www.instagram.com/music.tlv/', 'https://www.instagram.com/applemusic/'].sample,
    youtube_link: ['https://youtu.be/jpv2tMJJuz0', 'https://youtu.be/iceS6BvhuQ8', 'https://youtu.be/FjHGZj2IjBk'].sample,
    spotify_link: 'https://open.spotify.com/playlist/37i9dQZF1DWSYF6geMtQMW',
    address: ["Afula", "Akko", "Arad", "Ariel", "Ashdod", "Ashkelon", "Baqa al-Gharbiyye", "Bat Yam", "Beer Sheva", "Beit Shean", "Beit Shemesh", "Betar Illit", "Bnei Berak", "Dimona", "Eilat", "Elad", "Givatayim", "Hadera", "Haifa", "Harish", "Herzliya", "Hod HaSharon", "Holon", "Jerusalem", "Karmiel", "Kfar Sava", "Kiryat Ata", "Kiryat Bialik", "Kiryat Gat", "Kiryat Malachi", "Kiryat Motzkin", "Kiryat Ono", "Kiryat Shemone", "Kiryat Yam", "Lod", "Maale Adumim", "Maalot Tarshiha", "Migdal HaEmek", "Modiin", "Nahariya", "Nazareth", "Nes Ziona", "Nesher", "Netanya", "Netivot", "Nof Hagalil", "Ofakim", "Or Akiva", "Or Yehuda", "Petah Tikva", "Qalansawe", "Raanana", "Rahat", "Ramat Hasharon", "Ramat-Gan", "Ramla", "Rehovot", "Rishon Lezion", "Rosh Ha'ayin", "Sakhnin", "Sderot", "Shefaram", "Taibeh", "Tamra", "Tel Aviv", "Tiberias", "Tira", "Tirat Carmel", "Tsfat (Safed)", "Umm al-Fahm", "Yavne", "Yehud-Monosson", "Yokneam"].sample,
  )
  file = URI.open(photos.sample)
  new_offer.user = [User.first, User.last].sample
  new_offer.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  new_offer.save!
end

Booking.create!(date: Date.today, user: User.first, offer: Offer.first, status: 'pending')
