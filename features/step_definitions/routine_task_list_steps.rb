
Given /the following tasks exist/ do |tasks_table|
  tasks_table.hashes.each do |task|
    Task.create(task)
  end
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

When /I add a task (.*)/ do |task|
  Routine.create(task)
end

When /I modify the (.*) of a task/ do |task_param|

end

When /I delete a task (.*) from a routine (.*)/ do |task_title, routine_title|
  Task.destroy(task_title)
end