# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

alice = Coach.create!(name: "Alice", phone: "1-800-ALICE")
bob = Student.create!(name: "Bob", phone: "1-800-BOBB")
chris = Coach.create!(name: "Chris", phone: "1-800-CHRIS")
diane = Student.create!(name: "Diane", phone: "1-800-DIANE")
emily = Coach.create!(name: "Emily", phone: "1-800-EMILY")

Call.create!(coach: alice, student: bob, start: Time.zone.now + 1.day)
Call.create!(coach: alice, start: Time.zone.now + 2.day)
Call.create!(coach: chris, student: diane, start: Time.zone.now + 2.days)
