# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Category.destroy_all
#Entry.destroy_all
#Day.destroy_all
#category = Category.create(name: "What I'm Reading")
#day = Day.create(name: "Friday", date: 20200501)
#category = Category.create(name: "Lesson Learned")
#category = Category.create(name: "3 Things")
#category = Category.create(name: "Problem Solved")
#category = Category.create(name: "Theo Training")
#category = Category.create(name: "Something Nice!")
#category = Category.create(name: "In the Garden")
#category = Category.create(name: "Thinking About")
#category = Category.create(name: "In Progress")

day = Day.create!(name: "Thursday", date: "2020-12-31", user_id: 1, entries_attributes: [
  {content: "1", day_id: 1, category_id: 37},
  {content: "2", day_id: 1, category_id: 37},
  {content: "3", day_id: 1, category_id: 37},
  {content: "4", day_id: 1, category_id: 37},
  {content: "5", day_id: 1, category_id: 37},
  {content: "6", day_id: 1, category_id: 37}
  ], image_attributes:
    {url: "/Users/Leslie/development/projects/i-was-there-frontend/src/images/Theoinvestcopy.jpg", caption: "Theo", day_id: 1}
    )
#entry = Entry.create(category_id: 1, day_id: 1, contents: "The Autobiography of Malcolm X", date: 20200430)
#question = Question.create(number: 1, content: 'What is the capital city of Texas?')
#answer = Answer.create(question_id: 1, content: 'Austin', correct: '1')
