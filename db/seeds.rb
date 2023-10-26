# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

tasks = [
  { title: 'Bench press', description: "5x5rep bench press", is_duration: true, duration: 8},
  { title: 'Bicep curls', description: "3x12reps standing bicep curls", is_duration: true, duration: 4},
  { title: 'Moisturize', description: "Skincare routine step 4"},
  { title: 'Preheat oven to 375', description: "The first step in several baking recipes"},
]

tasks.each do |t|
  Task.create!(t)
end


routines = [
  { title: 'Evening Workout', description: "A quick evening workout"},
  { title: 'Skincare Routine', description: "A simple skincare regiment"},
  { title: 'Morning Routine', description: "A weekday morning"},
  { title: 'The Perfect Grilled Cheese', description: "All the steps for a perfect sandwich"},
]

routines.each do |r|
  Routine.create!(r)
end
