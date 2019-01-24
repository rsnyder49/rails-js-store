# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ username: 'Jon', password: 'pass', balance: 10.00 }, { username: 'Bran', password: 'pass', balance: 10.00 }])

items = Item.create([{ name: 'Shirt', description: 'Black', price: 9.99, quantity: 1, img_url: 'https://pixel.nymag.com/imgs/daily/strategist/2018/03/23/black-t-shirts/15.w710.h473.2x.jpg' }, { name: 'Sweatshirt', description: 'White', price: 14.99, quantity: 2, img_url: 'https://gloimg.zafcdn.com/zaful/pdm-product-pic/Clothing/2017/11/08/goods-first-img/1510115723386797482.JPG' }, { name: 'Jeans', description: 'Blue', price: 9.99, quantity: 0, img_url: 'https://www.jcrew.com/s7-img-facade/H6415_DM1987' }])
