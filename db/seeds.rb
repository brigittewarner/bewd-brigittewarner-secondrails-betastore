apparel = Category.create(name: 'apparel')
apple = Category.create(name: 'Apple')
accessory = Category.create(name: 'accessory')
swag = Category.create(name: 'swag')

hat = Product.create(name: 'hat', price: '12.99', image_url: '/images/products/hat.jpg', categories: [apparel, swag])
hoodie = Product.create(name: 'hoodie', price: '29.99', image_url: '/images/products/hoodie.jpg', categories: [apparel])
iphone_case = Product.create(name: 'iphone_case', price: '15.99', image_url: '/images/products/iphone_case.jpg', categories: [apple, accessory])
journal = Product.create(name: 'journal', price: '5.99', image_url: '/images/products/journal.jpg', categories: [swag, accessory])
sticker = Product.create(name: 'sticker', price: '0.99', image_url: '/images/products/sticker.jpg', categories: [swag])
coffee_mug = Product.create(name: 'coffee_mug', price: '8.99', image_url: '/images/products/coffee_mug.jpg', categories: [swag])

brigittewarner = User.create!(email: 'mail@brigittewarner.com', password: 'secret')





#%w[hat hoodie iphone_case journal shirt sticker ].each do |name|
#	Product.create(name: name.titleize, price: rand(10), image_url)