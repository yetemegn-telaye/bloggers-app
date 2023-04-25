# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'John', photo: 'new.jpg', bio: 'My bio')

post1 = Post.create(title: 'New title', text: 'Body text', author: user1)

comment1 = Comment.create(post: post1,text: 'New comment', author: user1)

like1 = Like.create(post: post1, author: user1)