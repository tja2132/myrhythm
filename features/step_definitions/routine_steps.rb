
Given /the following routines exist/ do |routines_table|
    routines_table.hashes.each do |routine|
      Routine.create(routine)
    end
  end
  
  Then /I should see all the routines/ do
    Routine.all.each do |routine|
      step %{I should see "#{routine.title}"}
    end
  end

  Then /(.*) seed routines should exist/ do | n_seeds |
    expect(Routine.count).to eq n_seeds.to_i
  end

  Then /I should see "(.*)" (\d) times/ do | routine_name, freq |
    expect(page).to have_content(routine_name, count: freq)
  end

# TODO
  # When /I follow "(.*)" button for the "(.*)" routine/ do |button_name, routine_id|
  #   within find('tr', text: "#{routine_id}") do
  #       click_link("#{button_name}")
  #   end
  # end

