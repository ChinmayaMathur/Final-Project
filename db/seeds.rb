# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Like.destroy_all
Custumer.destroy_all
Comment.destroy_all
Book.destroy_all


PASSWORD='supersecret'
super_custumer=Custumer.create(
    first_name: 'Jon',
    last_name: 'Snow',
    email: 'js@winterfell.gov',
    password: PASSWORD,
    is_admin: true
)

10.times do
      first_name=Faker::Name.first_name
      last_name=Faker::Name.last_name
      Custumer.create(
          first_name: first_name,
          last_name: last_name,
          email: "#{first_name}.#{last_name}@example.com",
          password: PASSWORD
      )
end
custumers=Custumer.all


50.times do
      created_at = Faker::Date.backward(days:365 * 5)
      b = Book.create(
          name_of_book: Faker::Hacker.say_something_smart,
          description: Faker::ChuckNorris.fact,
          author: Faker::Name.first_name,
          price: rand(500),
          no_of_books_available: rand(100),
          main_img: "https://images.unsplash.com/photo-1598153346810-860daa814c4b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGFycnklMjBwb3R0ZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
          detail_img: "https://images.unsplash.com/photo-1598153346810-860daa814c4b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGFycnklMjBwb3R0ZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
          created_at: created_at,
          updated_at: created_at,
          custumer: custumers.sample
      )
      if b.persisted? 
            b.comments = rand(0..15).times.map do
                  Comment.new(body: Faker::GreekPhilosophers.quote, custumer: custumers.sample)
            end
      end
      b.likers = custumers.shuffle.slice(0, rand(custumers.count))
end
  
books = Book.all
comments = Comment.all

puts Cowsay.say("Generated #{books.count} books", :cow)
puts Cowsay.say("Generated #{comments.count} comments", :tux)
puts Cowsay.say("Generated #{custumers.count} custumers", :beavis)
puts Cowsay.say("Login with #{super_custumer.email} and password: #{PASSWORD}", :koala)