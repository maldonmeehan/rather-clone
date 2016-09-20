# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do | i |
  # Generate a user
  user = User.new
  user.email = Faker::Internet.email
  user.password = "test_password"
  user.password_confirmation = "test_password"
  user.save!
  # generate a profile
  profile = Profile.new
  profile.name = Faker::Name.name
  profile.country = Faker::Address.country
  profile.gender = Faker::StarWars.specie
  profile.user = user
  profile.save!

  # generate answers
  answer1 = Answer.new(content: Faker::Hipster.sentence(3, false, 4))
  answer2 = Answer.new(content: Faker::Hipster.sentence(3, false, 4))
  question = Question.create(profile: profile, answers: [answer1, answer2])

  vote = Vote.new
  vote.profile = profile
  vote.answer = answer1
  vote.save!
end
