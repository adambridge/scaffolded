# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

alice = Coach.create!(name: "Alice", phone: "001-456-7890")
bob = Student.create!(name: "Bob", phone: "002-456-7890")
chris = Coach.create!(name: "Chris", phone: "003-456-7890")
diane = Student.create!(name: "Diane", phone: "004-456-7890")
emily = Coach.create!(name: "Emily", phone: "004-456-7890")

Call.create!(coach: alice, student: bob, start: Time.zone.now + 1.day)
Call.create!(coach: chris, student: diane, start: Time.zone.now + 2.days)
