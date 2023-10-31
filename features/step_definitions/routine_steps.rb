
Given /the following routines exist/ do |routines_table|
    routines_table.hashes.each do |routine|
      Routine.create(routine)
    end
  end
  
  Then /I should see all the routines/ do
    # Make sure that all the movies in the app are visible in the table
    Routine.all.each do |routine|
      step %{I should see "#{routine.title}"}
    end
  end

  Then /(.*) seed routines should exist/ do | n_seeds |
    expect(Routine.count).to eq n_seeds.to_i
  end

  When /I add a routine (.*)/ do |routine|
    Routine.create(routine)
  end

  When /I modify the (.*) of a routine/ do |routine_param|

  end

  When /I delete a routine/ do |routine_title|
    Routine.destroy(routine_title)
  end