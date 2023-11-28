
Given /the following routines exist for the user "(.*)"/ do |user_email, routines_table|
  user = User.find_by_email("#{user_email}") 
  routines_table.hashes.each do |routine|
      user.routines.create!(routine)
    end
  end
  
  Then /I should see all the routines for the email "(.*)"/ do | email |
    user = User.find_by_email("#{email}")
    user.routines.all.each do |routine|
      step %{I should see "#{routine.title}"}
    end
  end

  Then /(.*) seed routines should exist/ do | n_seeds |
    expect(Routine.count).to eq n_seeds.to_i
  end

  Then /I should see "(.*)" (\d) times?/ do | routine_name, freq |
    expect(page).to have_content(routine_name, count: freq)
  end

  Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    expect(page.body.index(e1) < page.body.index(e2))
  end

  Then /I should not see "(.*)" before "(.*)"/ do |e1, e2|
    expect(page.text).not_to match(/.*#{e1}.*#{e2}.*/)
  end

  Then /I should see "(.*)" after "(.*)"/ do |e1, e2|
    expect(page.body.index(e1) > page.body.index(e2))
  end

  Then /I should not see "(.*)" after "(.*)"/ do |e1, e2|
    expect(page.text).not_to match(/.*#{e2}.*#{e1}.*/)
  end

# TODO
   And /I follow the "(.*)" button for the routine "(.*)"/ do |button_name, routine_name|
    routine = Routine.find_by(:title => "#{routine_name}")  
    click_link("#{button_name}_routine_#{routine.id}")
   end

