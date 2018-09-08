# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

aj = User.create!(username: 'AJ')
jeremiah = User.create!(username: 'Jeremiah')
harambe = User.create!(username: 'rip')

app_academy_poll = Poll.create!(author: harambe, title: "AA Poll")

jeremiahs_question = Question.create!(
  text: 'Who is the top student in this cohort?',
  poll: app_academy_poll
)

a_whoops = AnswerChoice.create!(question: jeremiahs_question, text: "Jeremiah")

ajs_question = Question.create!(
  text: 'Who is the bottom student in this cohort?',
  poll: app_academy_poll
)

a0 = AnswerChoice.create!(question: ajs_question, text: "Jeremiah")

harambes_question = Question.create!(
  text: 'Opinion on murdering zoo animals in cold blood',
  poll: app_academy_poll
)

a1 = AnswerChoice.create!(question: harambes_question, text: "Jeremiah")
a2 = AnswerChoice.create!(question: harambes_question, text: "It's great!")
a3 = AnswerChoice.create!(question: harambes_question, text: "Absolutely!")

Response.create!(respondent: jeremiah, answer_choice: a_whoops)
Response.create!(respondent: jeremiah, answer_choice: a0)
Response.create!(respondent: jeremiah, answer_choice: a2)
Response.create!(respondent: aj, answer_choice: a3)
