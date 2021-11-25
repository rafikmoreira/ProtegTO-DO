# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "rafikmoreiradias@gmail.com", password: "1234", nome: "Rafik Moreira")
User.create(email: "carlos@gmail.com", password: "1234", nome: "Carlos Dias")
User.create(email: "maria@gmail.com", password: "1234", nome: "Maria Sousa")


50.times do |i|
  Tarefa.create(
    titulo: Faker::Book.title,
    descricao: Faker::Hipster.paragraph,
    status: Faker::Number.binary(digits: 1),
    visibilidade: Faker::Number.binary(digits: 1),
    user_id: Faker::Number.between(from: 1, to: 3)
  )
end