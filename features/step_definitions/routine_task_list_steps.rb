
Given /the following tasks exist for the "(.*)"/ do |routine_name, tasks_table|
  routine = Routine.find_by(:title => "#{routine_name}")
  tasks_table.hashes.each do |task|
    routine.tasks.create(task)
  end
end

And /I follow the "(.*)" button for the "(.*)" task/ do |button_name, task_name|
  task = Task.find_by(:title => "#{task_name}")
  #find(id: "").visible?
  click_link(:id => "#{button_name}_task_#{task.id}")
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
