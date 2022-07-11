# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create!(
 description: "Bitcoin",
 acronym:"BTC",
 url_image:"https://logos-world.net/wp-content/uploads/2020/08/Bitcoin-Emblem.png"
)
Coin.create!(
 description: "Ethereum",
 acronym:"ETH",
 url_image:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"
)
Coin.create!(
 description: "Monero",
 acronym:"XMR",
 url_image:"https://seeklogo.com/images/M/monero-logo-4EB9795194-seeklogo.com.png"
)

