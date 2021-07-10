# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup, popularity: ).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }], popularity: )
#   Character.create(name: 'Luke', movie: movies.first, popularity: )

# PIZZA
Pizza.destroy_all

pizza1 = Pizza.create(name: "Монтанара", price: 12, ingredients: "томатный соус, крем-чиз соус, сыр моцарелла, салями пепперони, бекон в/к, пармезан, орегано", description: "вкусно", weight: 470, photo: "montanara", popularity: 1)
pizza2 = Pizza.create(name: "Мясная", price: 12, ingredients: "томатный соус, сыр моцарелла, говядина в/к, бекон в/к, руккола, орегано", description: "вкусно", weight: 480, photo: "meaty", popularity: 1)
pizza3 = Pizza.create(name: "Огонь", price: 12, ingredients: "томатно-сырный соус, сыр моцарелла, колбаска Пепперони, филе куриное в/к, орегано", description: "вкусно", weight: 510, photo: "fire", popularity: 1)
pizza4 = Pizza.create(name: "Баварская", price: 10, ingredients: "томатный соус, сыр моцарелла, колбаски охотничьи, шампиньоны, огурчик маринованный, соус горчичный, орегано", description: "вкусно", weight: 480, photo: "bavarian", popularity: 2)
pizza5 = Pizza.create(name: "Барбекю", price: 14, ingredients: "томатный соус, соус Барбекю, бекон в/к, филе куриное в/к, лучок маринованный, шампиньоны, оливки, орегано", description: "вкусно", weight: 520, photo: "barbekyu", popularity: 2)
pizza6 = Pizza.create(name: "Ветчина Грибы", price: 12, ingredients: "томатный соус, сыр моцарелла, ветчина в/к, бекон в/к, шампиньоны, огурчик маринованный, орегано", description: "вкусно", weight: 480, photo: "vetchina", popularity: 2)
pizza7 = Pizza.create(name: "Курица и сладкий перчи", price: 12, ingredients: "томатный соус, сыр моцарелла, филе куриное в/к, бекон в/к, сладкий перчик, орегано", description: "вкусно", weight: 480, photo: "chicken", popularity: 3)
pizza8 = Pizza.create(name: "Пепперони", price: 10, ingredients: "томатный соус, сыр моцарелла, колбаска Пепперони, орегано", description: "вкусно", weight: 420, photo: "pepperoni", popularity: 3)
pizza9 = Pizza.create(name: "Примавера", price: 14, ingredients: "томатный соус, сыр моцарелла, перчик болгарский, соус песто, каперсы, руккола, пармезан, орегано", description: "вкусно", weight: 470, photo: "primavera", popularity: 3)
pizza10 = Pizza.create(name: "Четыре сыра", price: 14, ingredients: "томатный соус, сыр моцарелла, Дор Блю, Чеддер, Пармезан, орегано, базилик", description: "вкусно", weight: 420, photo: "fourcheeses", popularity: 4)
pizza11 = Pizza.create(name: "Маргарита", price: 8, ingredients: "томатный соус, сыр моцарелла, орегано, базилик", description: "вкусно", weight: 380, photo: "margarita", popularity: 4)

puts "Total number of products: #{Pizza.all.count}"
puts "Product names: #{Pizza.all.pluck("name")}"
puts "pizza1: #{pizza1.name} price: #{pizza1.price.round(2)}"
puts "pizza2: #{pizza2.name} price: #{pizza2.price.round(2)}"
puts "pizza3: #{pizza3.name} price: #{pizza3.price.round(2)}"
puts "pizza4: #{pizza4.name} price: #{pizza4.price.round(2)}"
puts "pizza5: #{pizza5.name} price: #{pizza5.price.round(2)}"
puts "pizza6: #{pizza6.name} price: #{pizza6.price.round(2)}"
puts "pizza7: #{pizza7.name} price: #{pizza7.price.round(2)}"
puts "pizza8: #{pizza8.name} price: #{pizza8.price.round(2)}"
puts "pizza9: #{pizza9.name} price: #{pizza9.price.round(2)}"
puts "pizza10: #{pizza10.name} price: #{pizza10.price.round(2)}"
puts "pizza11: #{pizza11.name} price: #{pizza11.price.round(2)}"

#CART
# Cart.destroy_all
# puts "\nTotal cart count: #{Cart.all.count}"