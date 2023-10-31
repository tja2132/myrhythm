
Given /the following routines exist/ do |routines_table|
    routines_table.hashes.each do |routine|
      Routine.create(routine)
    end
  end
  
  Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
    #  ensure that that e1 occurs before e2.
    #  page.body is the entire content of the page as a string.
    expect(page.body.index(e1) < page.body.index(e2))
  end
  
  Then /I should see all the routines/ do
    # Make sure that all the movies in the app are visible in the table
    Routine.all.each do |routine|
      step %{I should see "#{routine.title}"}
    end
  end