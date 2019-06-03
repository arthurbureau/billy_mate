# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Begin of Seed"
puts 'Destoying all'

# users = User.all
# users.each do |user|
#   user.flat = nil
# end

User.destroy_all
Flat.destroy_all
Bill.destroy_all
Transaction.destroy_all


puts 'Creation flats'
flat1 = Flat.create!(name: 'Coloc du Soleil')

puts 'Creation user'

avatar1 = "https://res.cloudinary.com/dzh1pkhi5/image/upload/v1559210596/P1070719-Modifier_sm2qen.jpg"
avatar2 = "https://res.cloudinary.com/dzh1pkhi5/image/upload/v1559210626/P1070808-Modifier_tjyeow.jpg"
avatar3 = "https://res.cloudinary.com/dzh1pkhi5/image/upload/v1559210611/P1080078-Modifier_keyxve.jpg"
avatar4 = "https://res.cloudinary.com/dzh1pkhi5/image/upload/v1559210612/P1080405-Modifier_akipz2.jpg"


user1 = User.new(nickname: 'tutur', first_name: 'Arthur', last_name: 'Bureau', phone_number: '06 81 10 11 26', email: 'arthur@gmail.com', password: 'xxxxxxx', flat: flat1)
user2 = User.new(nickname: 'anneso', first_name: 'Anne-Sophie', last_name: 'Ducamin', phone_number: '07 62 10 11 26', email: 'anneso@gmail.com', password: 'xxxxxxx', flat: flat1)
user3 = User.new(nickname: 'romish', first_name: 'Roman', last_name: 'Prat-Bourdon', phone_number: '06 41 16 98 26', email: 'roman@gmail.com', password: 'xxxxxxx', flat: flat1)
user4 = User.new(nickname: 'alex', first_name: 'Alexandrine', last_name: 'Lamy', phone_number: '0643 16 98 26', email: 'alex@gmail.com', password: 'xxxxxxx', flat: nil)

user1.remote_avatar_url = avatar1
user1.save!
user2.remote_avatar_url = avatar2
user2.save!
user3.remote_avatar_url = avatar3
user3.save!
user4.remote_avatar_url = avatar4
user4.save!
#gérer les avatar avec Cloudinary

puts 'Creation bills'

elect = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 5, 23))
gaz = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 5, 15))
eau = Bill.create!(flat: flat1, category: 'Eau', provider: 'Bordeaux Métropole', user: user3, amount_cents: 2000, payment_date: Date.new(2019, 5, 20))

elect1 = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 6, 23))
gaz1 = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 6, 15))
eau1 = Bill.create!(flat: flat1, category: 'Eau', provider: 'Bordeaux Métropole', user: user3, amount_cents: 2000, payment_date: Date.new(2019, 6, 20))

#gérer contracts pictures avec Cloudinary

puts 'Creation transactions'

elect_transaction1 = Transaction.create!(bill: elect, user: user2, amount_cents: 2000, payment_date: Date.new(2019, 5, 25))
elect_transaction2 = Transaction.create!(bill: elect, user: user3, amount_cents: 2000, payment_date: Date.new(2019, 6, 5))

puts "Seed finished !"
