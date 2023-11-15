
Given /the following tasks exist/ do |tasks_table|
  tasks_table.hashes.each do |task|
    Task.create(task)
  end
end

When /I follow "(.*)" button for the "(.*)" task/ do |button_name, task_id|
  click_link("#{button_name}_task_#{task_id}")
end

Then /I should see all the tasks/ do
  # Make sure that all the movies in the app are visible in the table
  Task.all.each do |task|
    step %{I should see "#{task.title}"}
  end
end

Then /(.*) seed tasks should exist/ do | n_seeds |
  expect(ask.count).to eq n_seeds.to_i
end
