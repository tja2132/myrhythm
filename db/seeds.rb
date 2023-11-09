# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

routines = [{:title => 'Evening Workout', :description => "A quick evening workout", :mon => true, :tue => true, :fri => true,
             start_day: 'M', start_time: Time.local(2023, 1, 1, 12, 0)},
            {:title => 'Skincare Routine', :description => "A simple skincare regiment", :mon => true,
             :tue => true, :wed => true, :thu => true, :fri => true, :sat => true, :sun => true,
             start_day: 'Sa', :start_time  => Time.local(2023, 1, 1, 6, 0)},
            {:title => 'The Perfect Grilled Cheese', :description => "All the steps for a perfect sandwich"}]

routines.each do | routine |
    Routine.create!(routine)
end

tasks = [{:sequence => 1, :routine => Routine.find_by_title("Evening Workout"), :title => 'Bench press', :description => "5x5rep bench press", duration: 8},
         {:sequence => 2, :routine => Routine.find_by_title("Evening Workout"), :title => 'Bicep curls', :description => "3x12reps standing bicep curls", duration: 4},
         {:sequence => 3, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Treadmill', :description => "30 minute treadmill", duration: 30},
         {:sequence => 1, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Face wash', :description => "Skincare routine step 1"},
         {:sequence => 2, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Toner', :description => "Skincare routine step 2"},
         {:sequence => 3, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Moisturize', :description => "Skincare routine step 3"},
         {:sequence => 1, :routine => Routine.find_by_title("The Perfect Grilled Cheese"), :title => 'Make the grilled cheese', :description => "That's it.", :duration => 15}]

tasks.each do |task|
    Task.create!(task)
end