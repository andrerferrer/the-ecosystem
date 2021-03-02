# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

def add_users # creates 6 users
  (1..6).each do |x|
    puts "creating user #{x}"
    User.create!(email: "kilian#{x}@gmail.com",
                password: "123456",
                nickname: "kilian#{x}",
                level: ["starter", "intermediate", "pro", "expert"].sample,
                slogan: "I know the REAL hacks!")
    puts "created user #{x}"
  end
end

def add_posts # creates 6 posts
  (1..6).each do |x|
    puts "creating post #{x}"
    Post.create!(user_id: x,
                category: ["hack", "don't", "project"].sample,
                title: "Post No. #{x}, Title",
                topic: ["household", "energy", "diy"].sample,
                expect_co2: ["modest", "moderate", "good", "strong"].sample,
                expect_waste: ["modest", "moderate", "good", "strong"].sample,
                expect_resources: ["modest", "moderate", "good", "strong"].sample,
                expect_diyeffort: ["modest", "moderate", "good", "strong"].sample,
                expect_ecocost: ["modest", "moderate", "good", "strong"].sample)
    puts "created post #{x}"
  end
end

def add_comments # creates 12 comments, 2 on each post
  counter = 6
  (1..6).each do |x|
    Comment.create!(post_id: x, user_id: counter,
                    content: "Comment #{x} to Post #{x} from user #{x}: #{Faker::ChuckNorris.fact}")
    Comment.create!(post_id: x, user_id: counter,
                    content: "Comment #{x + 1} to Post #{x} from user #{x}: #{Faker::ChuckNorris.fact}")
  counter -= 1
  puts "created comments for post #{x}"
  end
end

def add_replies # puts 2 replies on each comment
  (1..12).each do |x|
    Reply.create!(comment_id: x, user_id: rand(1..6),
                  content: "#{Faker::ChuckNorris.fact}")
    puts "created reply for comment #{x}"
  end

end

def add_conversation # add conversations to user kilian1 and kilian2
  Conversation.create!(sender_id: 1, receiver_id: 2)
  puts "added conversation between user_id 1 and 2 (kilian1 and kilian2"
end

def add_messages
  (1..5).each do |x|
    Message.create(conversation_id: 1, user_id: rand(1..2), content: "#{Faker::ChuckNorris.fact}")
  end
end




add_users
add_posts
add_comments
add_replies
# add_conversation
# add_messages
