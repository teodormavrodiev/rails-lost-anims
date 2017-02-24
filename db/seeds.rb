require 'faker'

6.times do |i|
  city = City.new(name: Faker::Address.city)
  city.photo_url = "http://lorempixel.com/400/200/city/"
  city.save!

  6.times do |i|
    animal = LostAnimal.new(name: Faker::Name.name, owner: Faker::Name.first_name,
    owner_email: Faker::Internet.email, description: Faker::Lorem.paragraph)
    urls = ["http://lorempixel.com/400/200/animals/", "http://lorempixel.com/400/200/animals/",
      "http://lorempixel.com/400/200/animals/"]
    animal.photo_urls = urls
    animal.city = city
    animal.save!

    5.times do |i|
      comment = Comment.new(description: Faker::Lorem.paragraph)
      comment.lost_animal = animal
      comment.save!
    end
  end
end

