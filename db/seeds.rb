# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pizza.create(name: "Монтанара", price: 12, ingredients: "томатный соус, крем-чиз соус, сыр моцарелла, салями пепперони, бекон в/к, пармезан, орегано", description: "вкусно", weight: 470, photo: "montanara")
Pizza.create(name: "Мясная", price: 12, ingredients: "томатный соус, сыр моцарелла, говядина в/к, бекон в/к, руккола, орегано", description: "вкусно", weight: 480, photo: "meaty")
Pizza.create(name: "Огонь", price: 12, ingredients: "томатно-сырный соус, сыр моцарелла, колбаска Пепперони, филе куриное в/к, орегано", description: "вкусно", weight: 510, photo: "fire")
Pizza.create(name: "Баварская", price: 10, ingredients: "томатный соус, сыр моцарелла, колбаски охотничьи, шампиньоны, огурчик маринованный, соус горчичный, орегано", description: "вкусно", weight: 480, photo: "bavarian")
Pizza.create(name: "Барбекю", price: 14, ingredients: "томатный соус, соус Барбекю, бекон в/к, филе куриное в/к, лучок маринованный, шампиньоны, оливки, орегано", description: "вкусно", weight: 520, photo: "barbekyu")
Pizza.create(name: "Ветчина Грибы", price: 12, ingredients: "томатный соус, сыр моцарелла, ветчина в/к, бекон в/к, шампиньоны, огурчик маринованный, орегано", description: "вкусно", weight: 480, photo: "vetchina")
Pizza.create(name: "Курица и сладкий перчи", price: 12, ingredients: "томатный соус, сыр моцарелла, филе куриное в/к, бекон в/к, сладкий перчик, орегано", description: "вкусно", weight: 480, photo: "chicken")
Pizza.create(name: "Пепперони", price: 10, ingredients: "томатный соус, сыр моцарелла, колбаска Пепперони, орегано", description: "вкусно", weight: 420, photo: "pepperoni")
Pizza.create(name: "Примавера", price: 14, ingredients: "томатный соус, сыр моцарелла, перчик болгарский, соус песто, каперсы, руккола, пармезан, орегано", description: "вкусно", weight: 470, photo: "primavera")
Pizza.create(name: "Четыре сыра", price: 14, ingredients: "томатный соус, сыр моцарелла, Дор Блю, Чеддер, Пармезан, орегано, базилик", description: "вкусно", weight: 420, photo: "fourcheeses")
