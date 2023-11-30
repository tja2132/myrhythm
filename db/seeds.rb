# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = [
    { :email => 'email@columbia.edu', :password => '1234qwer',
      :first_name => "guest", :last_name => "user", :columbia_uni => "guest1204"}
  ]

users.each do | user |
    User.create!(user)
end

guest_user = User.find_by_email('email@columbia.edu')

routines = [
  {:title => 'Evening Workout', :description => "A quick evening workout", :mon => true, :tue => true, :fri => true,
   :start_time => Time.local(2023, 1, 1, 14, 0)},
  {:title => 'Skincare Routine', :description => "A simple skincare regiment", :mon => true, :tue => true, :wed => true,
   :thu => true, :fri => true, :sat => true, :sun => true, :start_time => Time.local(2023, 1, 1, 1, 0)},
  {:title => 'The Perfect Grilled Cheese', :description => "All the steps for a perfect sandwich",
   :start_time => Time.local(2023, 1, 1, 7, 0)},
  {:title => 'Morning Meditation', :description => "Start your day with mindfulness", :mon => true, :wed => true,
   :fri => true, :start_time => Time.local(2023, 1, 1, 4, 0)},
  {:title => 'Weekly Meal Prep', :description => "Plan and prepare your meals for the week", :sun => true,
   :start_time => Time.local(2023, 1, 1, 14, 0)},
  {:title => 'Yoga Session', :description => "A relaxing yoga routine", :tue => true, :thu => true, :sat => true,
   :start_time => Time.local(2023, 1, 1, 9, 0)},
  {:title => 'Reading Hour', :description => "Dedicated time for reading", :mon => true, :wed => true, :fri => true,
   :start_time => Time.local(2023, 1, 1, 8, 0)},
  {:title => 'Gardening Time', :description => "Tending to the garden", :sat => true, :sun => true,
   :start_time => Time.local(2023, 1, 1, 10, 0)},
  {:title => 'Daily Journaling', :description => "Reflect on your day", :mon => true, :tue => true, :wed => true,
   :thu => true, :fri => true, :sat => true, :sun => true, :start_time => Time.local(2023, 1, 1, 17, 0)},
  {:title => 'Language Learning', :description => "Practice a new language", :mon => true, :wed => true, :fri => true,
   :start_time => Time.local(2023, 1, 1, 18, 0)},
  {:title => 'Baking Sunday', :description => "Bake something new each Sunday", :sun => true,
   :start_time => Time.local(2023, 1, 1, 15, 0)},
  {:title => 'Cycling Adventure', :description => "A bike ride to enjoy nature", :tue => true, :thu => true,
   :start_time => Time.local(2023, 1, 1, 8, 0)}
]

routines.each do | routine |
  guest_user.routines.create!(routine)
end

tasks = [{:sequence => 1, :routine => Routine.find_by_title("Evening Workout"), :title => 'Bench press', :description => "5x5rep bench press", duration: 8},
         {:sequence => 2, :routine => Routine.find_by_title("Evening Workout"), :title => 'Bicep curls', :description => "3x12reps standing bicep curls", duration: 4},
         {:sequence => 3, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Treadmill', :description => "30 minute treadmill", duration: 30},
         {:sequence => 1, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Face wash', :description => "Skincare routine step 1"},
         {:sequence => 2, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Toner', :description => "Skincare routine step 2"},
         {:sequence => 3, :routine => Routine.find_by_title("Skincare Routine"), :title => 'Moisturize', :description => "Skincare routine step 3"},
         {:sequence => 1, :routine => Routine.find_by_title("The Perfect Grilled Cheese"), :title => 'Make the grilled cheese', :description => "That's it.", :duration => 15},

          {:sequence => 1, :routine => Routine.find_by_title("Morning Meditation"), :title => 'Find a Quiet Place', :description => "Find a calm and quiet place to meditate", :duration => 5},
          {:sequence => 2, :routine => Routine.find_by_title("Morning Meditation"), :title => 'Set Timer', :description => "Set a timer for 15 minutes for meditation", :duration => 1},
          {:sequence => 3, :routine => Routine.find_by_title("Morning Meditation"), :title => 'Breathing Exercises', :description => "Perform deep breathing exercises", :duration => 5},
          {:sequence => 4, :routine => Routine.find_by_title("Morning Meditation"), :title => 'Mindfulness', :description => "Focus on present moment awareness", :duration => 15},
          {:sequence => 5, :routine => Routine.find_by_title("Morning Meditation"), :title => 'Reflection', :description => "Reflect on your thoughts and feelings post-meditation", :duration => 5},

          # Weekly Meal Prep
          {:sequence => 1, :routine => Routine.find_by_title("Weekly Meal Prep"), :title => 'Plan Meals', :description => "Plan your meals for the week", :duration => 30},
          {:sequence => 2, :routine => Routine.find_by_title("Weekly Meal Prep"), :title => 'Grocery Shopping', :description => "Buy necessary ingredients", :duration => 60},
          {:sequence => 3, :routine => Routine.find_by_title("Weekly Meal Prep"), :title => 'Prep Ingredients', :description => "Chop and prepare ingredients", :duration => 45},
          {:sequence => 4, :routine => Routine.find_by_title("Weekly Meal Prep"), :title => 'Cook Meals', :description => "Cook your planned meals", :duration => 90},
          {:sequence => 5, :routine => Routine.find_by_title("Weekly Meal Prep"), :title => 'Store Meals', :description => "Properly store meals for the week", :duration => 30},

          # Yoga Session
          {:sequence => 1, :routine => Routine.find_by_title("Yoga Session"), :title => 'Set Up Space', :description => "Prepare your yoga space", :duration => 10},
          {:sequence => 2, :routine => Routine.find_by_title("Yoga Session"), :title => 'Warm-Up', :description => "Perform a warm-up routine", :duration => 15},
          {:sequence => 3, :routine => Routine.find_by_title("Yoga Session"), :title => 'Yoga Poses', :description => "Practice yoga poses", :duration => 30},
          {:sequence => 4, :routine => Routine.find_by_title("Yoga Session"), :title => 'Breathing Techniques', :description => "Practice yoga breathing techniques", :duration => 10},
          {:sequence => 5, :routine => Routine.find_by_title("Yoga Session"), :title => 'Cool Down', :description => "Cool down and relax", :duration => 10},

          # Reading Hour
          {:sequence => 1, :routine => Routine.find_by_title("Reading Hour"), :title => 'Choose a Book', :description => "Select a book to read", :duration => 5},
          {:sequence => 2, :routine => Routine.find_by_title("Reading Hour"), :title => 'Find a Cozy Spot', :description => "Find a comfortable spot to read", :duration => 5},
          {:sequence => 3, :routine => Routine.find_by_title("Reading Hour"), :title => 'Set a Timer', :description => "Set a timer for your reading session", :duration => 1},
          {:sequence => 4, :routine => Routine.find_by_title("Reading Hour"), :title => 'Take Notes', :description => "Jot down interesting points or thoughts", :duration => 10},
          {:sequence => 5, :routine => Routine.find_by_title("Reading Hour"), :title => 'Reflect on Reading', :description => "Reflect on what you read and learned", :duration => 5},

          # Gardening Time
          {:sequence => 1, :routine => Routine.find_by_title("Gardening Time"), :title => 'Water Plants', :description => "Water your garden plants", :duration => 15},
          {:sequence => 2, :routine => Routine.find_by_title("Gardening Time"), :title => 'Weeding', :description => "Remove weeds from the garden", :duration => 20},
          {:sequence => 3, :routine => Routine.find_by_title("Gardening Time"), :title => 'Pruning', :description => "Prune and trim your plants", :duration => 20},
          {:sequence => 4, :routine => Routine.find_by_title("Gardening Time"), :title => 'Plant New Seeds', :description => "Plant new seeds or seedlings", :duration => 30},
          {:sequence => 5, :routine => Routine.find_by_title("Gardening Time"), :title => 'Clean Up', :description => "Clean up your gardening area", :duration => 15},

            # Daily Journaling
            {:sequence => 1, :routine => Routine.find_by_title("Daily Journaling"), :title => 'Find a Quiet Spot', :description => "Find a quiet place for journaling", :duration => 5},
              {:sequence => 2, :routine => Routine.find_by_title("Daily Journaling"), :title => 'Reflect on Your Day', :description => "Reflect on the events of the day", :duration => 10},
              {:sequence => 3, :routine => Routine.find_by_title("Daily Journaling"), :title => 'Write Down Thoughts', :description => "Write down your thoughts and feelings", :duration => 15},
              {:sequence => 4, :routine => Routine.find_by_title("Daily Journaling"), :title => 'Set Goals', :description => "Write down goals for the next day", :duration => 10},
              {:sequence => 5, :routine => Routine.find_by_title("Daily Journaling"), :title => 'Review and Close', :description => "Review what you've written and close the session", :duration => 5},

            # Language Learning
              {:sequence => 1, :routine => Routine.find_by_title("Language Learning"), :title => 'Vocabulary Review', :description => "Review new vocabulary words", :duration => 15},
              {:sequence => 2, :routine => Routine.find_by_title("Language Learning"), :title => 'Grammar Practice', :description => "Practice grammar exercises", :duration => 20},
              {:sequence => 3, :routine => Routine.find_by_title("Language Learning"), :title => 'Listening Comprehension', :description => "Practice listening skills with audio or video", :duration => 15},
              {:sequence => 4, :routine => Routine.find_by_title("Language Learning"), :title => 'Speaking Practice', :description => "Practice speaking and pronunciation", :duration => 20},
              {:sequence => 5, :routine => Routine.find_by_title("Language Learning"), :title => 'Writing Exercise', :description => "Write sentences or a short paragraph", :duration => 20},

            # Baking Sunday
              {:sequence => 1, :routine => Routine.find_by_title("Baking Sunday"), :title => 'Choose a Recipe', :description => "Select a baking recipe to try", :duration => 10},
              {:sequence => 2, :routine => Routine.find_by_title("Baking Sunday"), :title => 'Gather Ingredients', :description => "Collect all necessary ingredients", :duration => 15},
              {:sequence => 3, :routine => Routine.find_by_title("Baking Sunday"), :title => 'Prep & Mix Ingredients', :description => "Prepare and mix ingredients as per recipe", :duration => 20},
              {:sequence => 4, :routine => Routine.find_by_title("Baking Sunday"), :title => 'Baking Time', :description => "Bake as instructed in the recipe", :duration => 30},
              {:sequence => 5, :routine => Routine.find_by_title("Baking Sunday"), :title => 'Cooling & Decoration', :description => "Allow baked goods to cool and then decorate", :duration => 20},

            # Cycling Adventure
              {:sequence => 1, :routine => Routine.find_by_title("Cycling Adventure"), :title => 'Prepare Your Bike', :description => "Check and prepare your bike", :duration => 15},
              {:sequence => 2, :routine => Routine.find_by_title("Cycling Adventure"), :title => 'Safety Gear', :description => "Put on safety gear", :duration => 5},
              {:sequence => 3, :routine => Routine.find_by_title("Cycling Adventure"), :title => 'Warm-Up', :description => "Do a brief warm-up exercise", :duration => 10},
              {:sequence => 4, :routine => Routine.find_by_title("Cycling Adventure"), :title => 'Set Route', :description => "Plan and set your cycling route", :duration => 10},
              {:sequence => 5, :routine => Routine.find_by_title("Cycling Adventure"), :title => 'Begin Cycling', :description => "Start your cycling adventure", :duration => 60}

]

tasks.each do |task|
    Task.create!(task)
end

guest_user.routines.all.each do |r|
  (1..11).each do |m|
    (1..30).each do |d|
      if rand(10) > 5
        guest_user.completions.create!(user: guest_user, routine: r, created_at: Time.local(2023, m, d, 12, 0))
      end
    end
  end


end