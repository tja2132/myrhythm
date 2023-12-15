
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
    #routine = Routine.find_by(:title => "#{routine_name}")  
    if "#{button_name}" == ("edit")
      find('tr', text: "#{routine_name}").find(:xpath, ".//a[i[contains(@class, 'bi bi-pencil-square')]]").click
    elsif "#{button_name}" == ("complete")
      find('tr', text: "#{routine_name}").find(:xpath, ".//a[i[contains(@class, 'bi bi-check')]]").click
    elsif "#{button_name}" == ("delete")
      find('tr', text: "#{routine_name}").find(:xpath, ".//a[i[contains(@class, 'bi bi-trash')]]").click
    end
   end

When /I (un)?check the following options: (.*)/ do |uncheck, option_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  if uncheck
    check_param = "uncheck"
  else
    check_param = "check"
  end

  for i in option_list.split(",") do
    param = i.strip()
    steps %Q{When I #{check_param} the "#{param}" checkbox}
  end
end
