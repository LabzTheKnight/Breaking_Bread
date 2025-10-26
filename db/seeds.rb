# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

Meal.destroy_all
User.destroy_all

puts 'Creating 14 admins...'

afolabi = User.new(email: 'aaafolayan@gmail.com', password: '1234567', nickname: 'afolabi', description: 'Absolute Foody. Living in Moers.')
hai = User.new(email: 'hai@gmail.com', password: '1234567', nickname: 'hai', description: 'food is life! 🍜' )
axel = User.new(email: 'axel@axel.com', password: '1234567', nickname: 'axel', description: 'eat, cycle, repeat 🚴‍♂️')
ronna = User.create(email: 'ronna@gmail.com', password: '1234567', nickname: 'Ronna Farley')
josephine = User.create(email: 'josephine@gmail.com', password: '1234567', nickname: 'Josephine Parton')
ruby = User.create(email: 'ruby@gmail.com', password: '1234567', nickname: 'Ruby Williams')
jeff = User.create(email: 'jef@gmail.com', password: '1234567', nickname: 'Jeff Sunderland')
damon = User.create(email: 'damon@gmail.com', password: '1234567', nickname: 'The Dude')
sabrina = User.create(email: 'sabrina@gmail.com', password: '1234567', nickname: 'Sabrina')
justus = User.create(email: 'justus@gmail.com', password: '1234567', nickname: 'Justus')
johnson = User.create(email: 'johnson@gmail.com', password: '1234567', nickname: 'Johnson')
william = User.create(email: 'william@gmail.com', password: '1234567', nickname: 'William')
eri = User.create(email: 'eri@gmail.com', password: '1234567', nickname: 'Eri')
natalia = User.create(email: 'natalia@gmail.com', password: '1234567', nickname: 'Natalia')
diego = User.create(email: 'diego@gmail.com', password: '1234567', nickname: 'Diego')

file30 = URI.open("https://avatars.githubusercontent.com/u/77808978?v=4")
file31 = URI.open("https://avatars.githubusercontent.com/u/108654212?v=4")
file32 = URI.open("https://avatars.githubusercontent.com/u/108351320?v=4")

afolabi.photos.attach(io: file30, filename: 'afo', content_type: 'image/jpg')
hai.photos.attach(io: file31, filename: 'hai', content_type: 'image/jpg')
axel.photos.attach(io: file32, filename: 'axel', content_type: 'image/jpg')

afolabi.save
hai.save
axel.save

puts 'Creating 19 delicious real meals...'

puts 'creating Tonkotsu Ramen...'
tonkotsuramen = Meal.new(
  name: "Tonkotsu Ramen",
  category: "Noodle Soup",
  cuisine: "Japanese",
  details: "I was inspired to make this recipe after I couldn't stop thinking of a similar dish served in my elementary
  school cafeteria more than 50 years ago! I would love to share one of my favorite meals.",
  portions: 1,
  diet: "normal",
  allergens: 'Sesame, Wheat, Eggs, Fish',
  expiry: "12.09.2022",
  address: "Spichernstraße 8, 50672 Cologne"
)
file1 = URI.open("https://takumi.koeln/wp-content/uploads/2021/10/ramen-koeln-2-shio.jpg")
file22 = URI.open("https://res.cloudinary.com/qhai/image/upload/v1662630383/production/87bc54_710f936f47774a0589e6a7ff481a9c2d_mv2_aprpvk.webp")
file23 = URI.open("https://res.cloudinary.com/qhai/image/upload/v1662630383/production/ramen-takumi-koeln-4_efgody.jpg")
tonkotsuramen.photos.attach([{io: file1, filename: 'ramen1', content_type: 'image/jpg'}, {io: file22, filename: 'ramen22', content_type: 'image/jpg'}, {io: file23, filename: 'ramen23', content_type: 'image/jpg'}])
tonkotsuramen.user = hai
tonkotsuramen.save

puts 'creating beefshrooms...'
beefshrooms = Meal.new(
  name: "Beef and Mushrooms",
  category: "Meat & Poultry",
  cuisine: "American",
  details: "A lovely meal which I cooked to last night. I would be happy to share with somebody!",
  portions: 2,
  diet: "Carnivore",
  allergens: 'mushrooms, wheat',
  expiry: "14.09.2022",
  address: "Meister-Ekkehart-Straße 9, 50937 Cologne"
)
file2 = URI.open("https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=800")
beefshrooms.photos.attach(io: file2, filename: 'beefshrooms', content_type: 'image/jpg')
beefshrooms.user = ronna
beefshrooms.save

puts 'creating Salmon chowder...'
salchow = Meal.new(
  name: "Simple Salmon Chowder",
  category: "Soup",
  cuisine: "American",
  details: "I've lived on a farm in the Yakima Valley all my life. I have a big garden, and by the end of fall, my
  cellar shelves are full of canned fruits and vegetables. This salmon chowder recipe uses some of the root vegetables
  I grow—along with the delicious salmon that is so plentiful here.",
  portions: 8,
  diet: "Pescetarian",
  allergens: 'fish',
  expiry: "15.09.2022",
  address: "Zülpicher Straße 203, 50937 Cologne"
)
file3 = URI.open("https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=800")
salchow.photos.attach(io: file3, filename: 'salchow', content_type: 'image/jpg')
salchow.user = josephine
salchow.save

puts 'creating Jambalaya...'
creojam = Meal.new(
  name: "Creole Jambalaya",
  category: "Soup",
  cuisine: "American",
  details: "Jambalaya is a traditional dish, coming from our Spanish and French culture. Rice is the main ingredient,
  with different meats or seafood mixed in. I particularly like this variation with shrimp and ham.",
  portions: 5,
  diet: "Carnivore",
  allergens: 'fish',
  expiry: "12.09.2022",
  address: "Lothringer Straße 22, 50677 Cologne"
)
file4 = URI.open("https://images.unsplash.com/photo-1588137378633-dea1336ce1e2?w=800")
creojam.photos.attach(io: file4, filename: 'creojam', content_type: 'image/jpg')
creojam.user = ruby
creojam.save

puts 'creating summer rolls...'
sumrolls = Meal.new(
  name: "Fresh summer rolls",
  category: "Cold Food",
  cuisine: "Vietnamese",
  details: "Fresh homemade hand rollen summer rolls ",
  portions: 8,
  diet: "Vegan",
  allergens: '',
  expiry: "10.09.2022",
  address: "Maternusstraße 15, 50678 Cologne"
)
file5 = URI.open("https://cdn.statically.io/img/www.aheadofthyme.com/f=auto//wp-content/uploads/2021/07/vietnamese-summer-rolls-with-chicken-2.jpg")
file40 = URI.open("https://cdn.tgdd.vn/Files/2021/08/28/1378488/cach-lam-goi-cuon-bo-xao-sa-thom-lung-ngon-mieng-dai-ca-nha-202201051121002357.jpg")
file41 = URI.open("https://www.resipis.de/wp-content/uploads/2016/07/vietnamesische-sommerrollen-mit-garnelen-und-nuoc-cham-1.jpg")
sumrolls.photos.attach([{io: file5, filename: 'sumrolls', content_type: 'image/jpg'}, {io: file40, filename: 'sumrolls2', content_type: 'image/jpg'}, {io: file41, filename: 'sumrolls3', content_type: 'image/jpg'}])
sumrolls.user = hai
sumrolls.save

puts 'creating jollof rice...'
jollof = Meal.new(
  name: "Jollof rice",
  category: "One Pot Dish",
  cuisine: "Nigerian",
  details: "Best Jollof rice in the world, far superior to Ghanaian 'version'. Happy to share :)",
  portions: 3,
  diet: "carnivore",
  allergens: 'includes Meat broth',
  expiry: "12.09.2022",
  address: "Karl-Korn-Straße 10, 50678 Cologne"
)
file6 = URI.open("https://cheflolaskitchen.com/wp-content/uploads/2018/10/Jollof-Rice-55.jpg")
jollof.photos.attach(io: file6, filename: 'jollof', content_type: 'image/jpg')
jollof.user = afolabi
jollof.save

puts 'creating beef-paprikash...'
beefpaprikash = Meal.new(
  name: "Beef Paprikash",
  category: "Stew",
  cuisine: "Hungarian",
  details: "Beef paprikash, a Hungarian dish, makes a marvelous dinner. I have plenty of portions for pick-up ready.",
  portions: 6,
  diet: "Carnivore",
  allergens: 'wheat butter meat',
  expiry: "12.09.2022",
  address: "Biberstraße 32, 50678 Cologne"
)
file7 = URI.open("https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=800")
beefpaprikash.photos.attach(io: file7, filename: 'beefpaprikash', content_type: 'image/jpg')
beefpaprikash.user = jeff
beefpaprikash.save

puts 'creating chicken-rice-skillet...'
chickenriceskillet = Meal.new(
  name: "Chicken Rice Skillet",
  category: "One Pot Dish",
  cuisine: "American",
  details: "Pleasant seasonings and plenty of vegetables highlight this traditional chicken and rice pairing. Can be
  easily reheated in the oven or microwave.",
  portions: 6,
  diet: "Carnivore",
  allergens: 'wheat butter meat',
  expiry: "12.09.2022",
  address: "Landsbergstraße 26, 50678 Cologne"
)
file8 = URI.open("https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=800")
chickenriceskillet.photos.attach(io: file8, filename: 'chickenriceskillet', content_type: 'image/jpg')
chickenriceskillet.user = jeff
chickenriceskillet.save

puts 'creating bean&beef chili...'
beanbeefchili = Meal.new(
  name: "Slow-Cooked Chili",
  category: "One Pot Dish",
  cuisine: "American",
  details: "This chili may be already chock-full, but we have it up even more topped up with toppings like pico de
  gallo, red onion, cilantro and cheese.",
  portions: 3,
  diet: "Carnivore",
  allergens: 'wheat butter meat onion',
  expiry: "14.09.2022",
  address: "Löwengasse 9, 50676 Cologne"
)
file9 = URI.open("https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=800")
beanbeefchili.photos.attach(io: file9, filename: 'beanbeefchili', content_type: 'image/jpg')
beanbeefchili.user = damon
beanbeefchili.save

puts 'creating hay and straw...'
haystraw = Meal.new(
  name: "Hay and Straw",
  category: "Pasta",
  cuisine: "Italian",
  details: "This colorful pasta dish combines julienned ham, Parmesan cheese, peas and linguine",
  portions: 4,
  diet: "Carnivore",
  allergens: 'wheat butter meat onion',
  expiry: "14.09.2022",
  address: "Krummer Büchel 2, 50676 Cologne"
)
file10 = URI.open("https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=800")
haystraw.photos.attach(io: file10, filename: 'haystraw', content_type: 'image/jpg')
haystraw.user = sabrina
haystraw.save

puts 'creating green bean soup...'
beansoup = Meal.new(
  name: "Bean Soup",
  category: "Soup",
  cuisine: "German",
  details: "Healthy and tasty soup. It's craveable on cold and rainy days.",
  portions: 4,
  diet: "Carnivore",
  allergens: 'meat',
  expiry: "10.09.2022",
  address: "Wöhlerstraße 35, 50823 Cologne"
)
file11 = URI.open("https://www.kuechengoetter.de/uploads/media/630x630/00/5760-gruener-bohneneintopf.jpg?v=1-0")
beansoup.photos.attach(io: file11, filename: 'beansoup', content_type: 'image/jpg')
beansoup.user = justus
beansoup.save

puts 'creating hong kong french toast...'
frenchtoast = Meal.new(
  name: "Hong Kong French Toast",
  category: "Breakfast",
  cuisine: "Hong Kong",
  details: "Stuffed with peanut butter, soaked in custard, fried to golden crispy perfection, and drizzled with
  sweetened condensed milk, it takes this classic breakfast treat to a whole new level.",
  portions: 4,
  diet: "Vegetarian",
  allergens: 'egg wheat',
  expiry: "10.09.2022",
  address: "Siebachstraße 105, 50733 Cologne"
)
file12 = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-220823-hong-kong-french-toast-388-horizontal-rv-web-1662038739.jpg?crop=0.895xw:0.855xh;0.0646xw,0.128xh&resize=980:*")
file23 = URI.open("https://imagesvc.meredithcorp.io/v3/mm/image?q=60&c=sc&poi=%5B711%2C451%5D&w=1582&h=791&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F43%2F2022%2F03%2F08%2F7016-french-toast-mfs-010.jpg")
file24 = URI.open("https://www.simplyrecipes.com/thmb/1r6e-oOPSGBkxbxY13tcRE1AvA8=/648x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Simply-Recipes-French-Toast-Lead-Shot-3b-c3a68a576a9548f5bd43cce3d2d7f4b7.jpg")

frenchtoast.photos.attach([{io: file12, filename: 'frenchtoast', content_type: 'image/jpg'}, {io: file23, filename: 'frenchtoast2', content_type: 'image/jpg'}, {io: file24, filename: 'frenchtoast3', content_type: 'image/jpg'}])
frenchtoast.user = johnson
frenchtoast.save

puts 'creating cheesy brussels sprout...'
brusselssprout = Meal.new(
  name: "Cheesy Brussels Sprout Bake",
  category: "One Pot Dish",
  cuisine: "Dutch",
  details: "This is one side dish that will make everyone freak out (and run for seconds).
  Tastes very reheated as well :)",
  portions: 2,
  diet: "Vegetarian",
  allergens: 'egg wheat',
  expiry: "12.09.2022",
  address: "Mauenheimer Straße 20, 50733 Cologne"
)
file13 = URI.open("https://hips.hearstapps.com/del.h-cdn.co/assets/18/11/1520902273-shot-1-56.jpg?crop=1.0xw:1xh;center,top&resize=980:*")
brusselssprout.photos.attach(io: file13, filename: 'brusselssprout', content_type: 'image/jpg')
brusselssprout.user = eri
brusselssprout.save

puts 'creating korean fried chicken...'
koreanfriedchicken = Meal.new(
  name: "Korean Fried Chicken",
  category: "Side",
  cuisine: "Korean",
  details: "Nicknamed “candy chicken,” Korean fried chicken is known for its addictively crunchy exterior and its
  thick sweet-and-spicy sauce.",
  portions: 4,
  diet: "Carnivore",
  allergens: 'egg wheat chili',
  expiry: "12.09.2022",
  address: "Erzbergerplatz 16, 50733 Cologne"
)
file14 = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/singleimagebug-korean-fried-chicken-1549305127.jpg?crop=1xw:0.9453781512605042xh;center,top&resize=980:*")
koreanfriedchicken.photos.attach(io: file14, filename: 'korean-fried-chicken', content_type: 'image/jpg')
koreanfriedchicken.user = natalia
koreanfriedchicken.save

puts 'creating beef Bourguignon...'
beefb = Meal.new(
  name: "Beef Bourguignon",
  category: "stew",
  cuisine: "Dutch",
  details: "Here is how I made it: Here's the basic rundown of this labor of love: Sauté bacon,
  sear beef in bacon fat (yum!), add veggies and stir to coat with flour, add wine and broth,
  transfer to oven, bake until beef is super-tender, make Julia Child proud.",
  portions: 4,
  diet: "Carnivore",
  allergens: 'egg wheat chili',
  expiry: "13.09.2022",
  address: "Appellhofplatz 16, 50667 Cologne"
)
file15 = URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190828-beef-bourguignon-0154-portrait-pf-1568132096.jpg?crop=1xw:0.9994736842105263xh;center,top&resize=768:*&keepGifs=1")
beefb.photos.attach(io: file15, filename: 'beef-b', content_type: 'image/jpg')
beefb.user = william
beefb.save

puts 'creating creamy vegan pasta...'
creamypasta = Meal.new(
  name: "Creamy Vegan Pasta",
  category: "Pasta",
  cuisine: "World",
  details: "I love putting vegetables at the center of my plate – not only is it good for my health and for the world,
  but it’s also downright delicious. I would be happy to share my newest creation with you.",
  portions: 3,
  diet: "Vegan",
  allergens: 'wheat',
  expiry: "13.09.2022",
  address: "Rheingasse 15, 50676 Cologne"
)
file16 = URI.open("https://cdn.loveandlemons.com/wp-content/uploads/2019/12/vegan-recipes.jpg")
creamypasta.photos.attach(io: file16, filename: 'creamy-pasta', content_type: 'image/jpg')
creamypasta.user = diego
creamypasta.save

puts 'creating Zucchini Fritters...'
zucchinifritters = Meal.new(
  name: "Zucchini Fritters",
  category: "Baked and Stuffed",
  cuisine: "Dutch",
  details: "I created this meals with homegrown zucchinis. Super delicious!",
  portions: 1,
  diet: "Vegan",
  allergens: '',
  expiry: "11.09.2022",
  address: "Leonhard-Tietz-Straße 8, 50676 Cologne"
)
file17 = URI.open("https://www.thespruceeats.com/thmb/LzlC4zHWABM91kFC76Zl6RAZqkk=/3244x2433/smart/filters:no_upscale()/zucchinifritters-56a5b26b5f9b58b7d0de04f2.jpg")
zucchinifritters.photos.attach(io: file17, filename: 'zucchini-fritters', content_type: 'image/jpg')
zucchinifritters.user = diego
zucchinifritters.save

puts 'creating caribbean tofu...'
caribbeantofu = Meal.new(
  name: "Caribbean Tofu with Coconut",
  category: "Fried",
  cuisine: "Caribbean",
  details: "This Caribbean Tofu with Coconut Quinoa is a great summery treat. Mixing lime and coconut with earthy spices
  and fiery chillies may just be the best way to carry them into a summer-read savoury dish.",
  portions: 2,
  diet: "Vegan",
  allergens: 'coconut soy',
  expiry: "12.09.2022",
  address: "Große Telegraphenstraße 34, 50676 Cologne"
)
file18 = URI.open("https://veganuary.com/wp-content/uploads/2016/09/Caribbean-Tofu-2.jpg")
caribbeantofu.photos.attach(io: file18, filename: 'caribbean-tofu', content_type: 'image/jpg')
caribbeantofu.user = hai
caribbeantofu.save

puts 'creating vegan cobbler...'
vegancobbler = Meal.new(
  name: "Brown Butter Peach Cobbler",
  category: "Dessert",
  cuisine: "French",
  details: "Peaches and blueberries get swirled with vegan brown butter and cobbler, making for a cake that’s sticky
  and caramelized on the outside yet fluffy and tender on the inside.",
  portions: 5,
  diet: "Vegan",
  allergens: 'coconut soy wheat',
  expiry: "14.09.2022",
  address: "Huhnsgasse 34, 50676 Cologne"
)
file19 = URI.open("https://rainbowplantlife.com/wp-content/uploads/2020/11/peachblueberrrycobbler287of1029.jpg")
vegancobbler.photos.attach(io: file19, filename: 'vegan-cobbler', content_type: 'image/jpg')
vegancobbler.user = afolabi
vegancobbler.save

puts 'creating tuscan chicken rissoles...'
tuscanchicken = Meal.new(
  name: "Tuscan chicken rissoles",
  category: "Side",
  cuisine: "Italian",
  details: "These creamy Italian chicken mince rissoles would be great over pasta, mash or polenta or served with crusty
  bread as an easy weeknight dinner",
  portions: 3,
  diet: "Carnivore",
  allergens: 'meat wheat',
  expiry: "14.09.2022",
  address: "Lothringer Straße 35, 50677 Cologne"
)
file20 = URI.open("https://img.taste.com.au/1KNqPo-z/w720-h480-cfill-q80/taste/2021/10/tuscan-chicken-rissoles-recipe-174147-2.jpg")
tuscanchicken.photos.attach(io: file20, filename: 'tuscan-chicken', content_type: 'image/jpg')
tuscanchicken.user = axel
tuscanchicken.save

puts 'creating Triple Chocolate Cake...'
choclatecake = Meal.new(
  name: "Triple Chocolate Cake",
  category: "Dessert",
  cuisine: "German",
  details: "This is my favorite homemade chocolate cake recipe. With a super moist crumb and fudgy, yet light texture,
  this chocolate cake recipe will soon be your favorite too.",
  portions: 4,
  diet: "Vegetarian",
  allergens: 'milk eggs wheat',
  expiry: "15.09.2022",
  address: "Paul-Schallück-Straße 7, 50939 Cologne"
)
file21 = URI.open("https://sallysbakingaddiction.com/wp-content/uploads/2013/04/triple-chocolate-cake-4.jpg")
choclatecake.photos.attach(io: file21, filename: 'choclate-cake', content_type: 'image/jpg')
choclatecake.user = axel
choclatecake.save

puts 'Finished!'
