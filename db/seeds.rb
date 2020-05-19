# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Entry.destroy_all
Day.destroy_all
category = Category.create(name: "What I'm Reading")
day = Day.create(name: "Friday", date: 20200501)
category = Category.create(name: "1000 words")
#entry = Entry.create(category_id: 1, day_id: 1, contents: "The Autobiography of Malcolm X", date: 20200430)
#question = Question.create(number: 1, content: 'What is the capital city of Texas?')
#answer = Answer.create(question_id: 1, content: 'Austin', correct: '1')
