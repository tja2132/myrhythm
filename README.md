# MyRhythm - Sync to the Beat of Your life

MyRhythm is a routine and task building application that allows you to find
your own rhythm in a chaotic life. Create routines, reminders, and habits that
decrease stress, save time, and help you find your flow.

### Developers:
* Melissa Pothen   - mp4138
* Hannah Haldren   - hvh2105
* Tyler Andrews    - tja2132
* Nathan Coulibaly - nmc2169

### Quick Start
For initial install:
```sh 
rbenv install 3.2.2
rbenv global 3.2.2
bundle install
rake db:setup
rails generate cucumber:install
rails generate rspec:install
rails generate rspec:model routine
rails generate rspec:model task
rails server
```

For database updates:
```sh
rake db:reset
```
If db:reset fails (error in migration)
```sh
rake db:drop:all
rake db:create:all
rake db:migrate
rake db:seed
```

Reference Links:
* [RSpec templates](https://github.com/rspec/rspec-rails)
* [Cucumber Rails](https://github.com/cucumber/cucumber-rails)
* [DO - Rbenv Install](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)
* [DO - RoR App](https://www.digitalocean.com/community/tutorials/how-to-build-a-ruby-on-rails-application)
* [DO - RoR App with Nested Resources](https://www.digitalocean.com/community/tutorials/how-to-create-nested-resources-for-a-ruby-on-rails-application)
* [RoR Docs - Nested Resources](https://guides.rubyonrails.org/routing.html#nested-resources)


### TODO
* Testing User stories with cucumber

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
