# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



r1 = Routine.create(title: 'Evening Workout', description: "A quick evening workout", recurrence: "Weekly", daysofweek: "M,W,F",
                    start_date: Time.local(2023, 1, 1), end_date: Time.local(2024, 1, 1),
                    start_time: Time.local(2023, 1, 1, 6, 0), end_time: Time.local(2023, 1, 1, 6, 35), )
r2 = Routine.create(title: 'Skincare Routine', description: "A simple skincare regiment", recurrence: "Daily", daysofweek: "M,T,W,Th,F,Sa,Su",
                    start_date: Time.local(2023, 1, 1), end_date: Time.local(2024, 1, 1),
                    start_time: Time.local(2023, 1, 1, 6, 0), end_time: Time.local(2023, 1, 1, 6, 35), )
r3 = Routine.create(title: 'The Perfect Grilled Cheese', description: "All the steps for a perfect sandwich", recurrence: "None")

Task.create(sequence: 1, routine: r1, title: 'Bench press', description: "5x5rep bench press", duration: 8)
Task.create(sequence: 2, routine: r1, title: 'Bicep curls', description: "3x12reps standing bicep curls", duration: 4)
Task.create(sequence: 3, routine: r1, title: 'Treadmill', description: "30 minute treadmill", duration: 30)
Task.create(sequence: 1, routine: r2, title: 'Face wash', description: "Skincare routine step 1")
Task.create(sequence: 2, routine: r2, title: 'Toner', description: "Skincare routine step 2")
Task.create(sequence: 3, routine: r2, title: 'Moisturize', description: "Skincare routine step 3")
Task.create(sequence: 1, routine: r3, title: 'Make the grilled cheese', description: "That's it.")