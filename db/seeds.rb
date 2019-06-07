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

avatar1 = "https://res.cloudinary.com/dzh1pkhi5/image/upload/v1559744384/arthurinsta_bshevj.jpg"
avatar2 = "https://res.cloudinary.com/dzh1pkhi5/image/upload/v1559744242/32821398_1919473874742877_7128333856549109760_o_gkiplg.jpg"


user1 = User.new(nickname: 'Tutur', first_name: 'Arthur', last_name: 'Bureau', phone_number: '+33681101126', email: 'arthur@gmail.com', password: 'xxxxxxx', flat: flat1)
user2 = User.new(nickname: 'Romish', first_name: 'Roman', last_name: 'Prat-Bourdon', phone_number: '+33641169826', email: 'roman@gmail.com', password: 'xxxxxxx', flat: flat1)

user1.remote_avatar_url = avatar1
user1.save!
user2.remote_avatar_url = avatar2
user2.save!
#gérer les avatar avec Cloudinary

puts 'Creation bills'

gazJan = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 1, 15), first: false)
gazFev = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 2, 15), first: false)
gazMars = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 3, 15), first: false)
gazAvr = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 4, 15), first: false)
gazMai = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 5, 15), first: false)
gazJuin = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 6, 15), first: false)
gazJul = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 7, 15), first: false)
gazAout = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 8, 15), first: false)
gazSept = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 9, 15), first: false)
gazOct = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 10, 15), first: false)
gazNov = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 11, 15), first: false)
gazDec = Bill.create!(flat: flat1, category: 'Gaz', provider: 'Gaz de Bordeaux', user: user2, amount_cents: 9000, payment_date: Date.new(2019, 12, 15), first: false)

electJan = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 1, 23), first: false)
electFev = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 2, 23), first: false)
electMars = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 3, 23), first: false)
electAvr = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 4, 23), first: false)
electMai = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 5, 23), first: false)
electJuin = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 6, 23), first: false)
electJul = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 7, 23), first: false)
electAout = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 8, 23), first: false)
electSept = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 9, 23), first: false)
electOct = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 10, 23), first: false)
electNov = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 11, 23), first: false)
electDec = Bill.create!(flat: flat1, category: 'Electricité', provider: 'EDF', user: user1, amount_cents: 6000, payment_date: Date.new(2019, 12, 23), first: false)

offretvJan = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 1, 4), first: false)
offretvFev = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 2, 4), first: false)
offretvMars = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 3, 4), first: false)
offretvAvr = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 4, 4), first: false)
offretvMai = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 5, 4), first: false)
offretvJuin = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 6, 4), first: false)
offretvJul = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 7, 4), first: false)
offretvAout = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 8, 4), first: false)
offretvSept = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 9, 4), first: false)
offretvOct = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 10, 4), first: false)
offretvNov = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 11, 4), first: false)
offretvDec = Bill.create!(flat: flat1, category: 'Canal +', provider: 'Canal +', user: user1, amount_cents: 3000, payment_date: Date.new(2019, 12, 4), first: false)

#gérer contracts pictures avec Cloudinary

puts 'Creation transactions'


elect_transaction2 = Transaction.create!(bill: electJan, user: user2, amount_cents: 3000, payment_date: Date.new(2019, 1, 25))
elect_transaction3 = Transaction.create!(bill: electFev, user: user2, amount_cents: 3000, payment_date: Date.new(2019, 2, 25))
elect_transaction4 = Transaction.create!(bill: electMars, user: user2, amount_cents: 3000, payment_date: Date.new(2019, 3, 25))
elect_transaction5 = Transaction.create!(bill: electAvr, user: user2, amount_cents: 3000, payment_date: Date.new(2019, 4, 25))
elect_transaction6 = Transaction.create!(bill: electMai, user: user2, amount_cents: 3000, payment_date: Date.new(2019, 5, 25))

gaz_transaction1 = Transaction.create!(bill: gazJan, user: user1, amount_cents: 4500, payment_date: Date.new(2019, 1, 18))
gaz_transaction2 = Transaction.create!(bill: gazFev, user: user1, amount_cents: 4500, payment_date: Date.new(2019, 2, 18))
gaz_transaction3 = Transaction.create!(bill: gazMars, user: user1, amount_cents: 4500, payment_date: Date.new(2019, 3, 18))
gaz_transaction4 = Transaction.create!(bill: gazAvr, user: user1, amount_cents: 4500, payment_date: Date.new(2019, 4, 18))
gaz_transaction5 = Transaction.create!(bill: gazMai, user: user1, amount_cents: 4500, payment_date: Date.new(2019, 5, 18))

offretv_transaction1 = Transaction.create!(bill: offretvJan, user: user2, amount_cents: 1500, payment_date: Date.new(2019, 1, 8))
offretv_transaction2 = Transaction.create!(bill: offretvFev, user: user2, amount_cents: 1500, payment_date: Date.new(2019, 2, 8))
offretv_transaction3 = Transaction.create!(bill: offretvMars, user: user2, amount_cents: 1500, payment_date: Date.new(2019, 3, 8))
offretv_transaction4 = Transaction.create!(bill: offretvAvr, user: user2, amount_cents: 1500, payment_date: Date.new(2019, 4, 8))
offretv_transaction5 = Transaction.create!(bill: offretvMai, user: user2, amount_cents: 1500, payment_date: Date.new(2019, 5, 8))

puts "Seed finished !"
