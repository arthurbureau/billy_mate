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


puts 'Creation flats'
flat1 = Flat.create!(name: 'Coloc du Soleil')

puts 'Creation user'

user1 = User.create!(nickname: 'tutur', first_name: 'Arthur', last_name: 'Bureau', phone_number: '06 81 10 11 26', email: 'arthur@gmail.com', password: 'xxxxxxx', flat: flat1)
user2 = User.create!(nickname: 'anneso', first_name: 'Anne-Sophie', last_name: 'Ducamin', phone_number: '07 62 10 11 26', email: 'anneso@gmail.com', password: 'xxxxxxx', flat: flat1)
user3 = User.create!(nickname: 'romish', first_name: 'Roman', last_name: 'Prat-Bourdon', phone_number: '06 41 16 98 26', email: 'roman@gmail.com', password: 'xxxxxxx', flat: flat1)

#gérer les avatar avec Cloudinary

puts 'Creation bills'

elect = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount: 60, payment_date: Date.new(2019, 5, 23))
gaz = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount: 90, payment_date: Date.new(2019, 5, 15))
internet = Bill.create!(flat: flat1, category: 'Internet', provider: 'SFR', user: user3, amount: 20, payment_date: Date.new(2019, 5, 6))
eau = Bill.create!(flat: flat1, category: 'Eau', provider: 'Bordeaux Métropole', user: user3, amount: 20, payment_date: Date.new(2019, 5, 20))

#gérer contracts pictures avec Cloudinary

puts 'Creation transactions'

elect_transaction1 = Transaction.create!(bill: elect, user: user2, amount: 20, payment_date: Date.new(2019, 5, 25))
elect_transaction2 = Transaction.create!(bill: elect, user: user3, amount: 20, payment_date: Date.new(2019, 6, 5))

puts "Seed finished !"
