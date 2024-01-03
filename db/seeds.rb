# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.find_by(email: 'user@example.com') || User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

10.times do |i|
  post = Post.new(
    title: "タイトル #{i}",
    content: "コンテンツ #{i}",
    user: user,
    public_private: [true, false].sample,
    anonymous: [true, false].sample
  )

  post.image = Rails.root.join('app/assets/images/girl.png').open

  post.save!
end

