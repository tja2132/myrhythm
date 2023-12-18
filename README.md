# MyRhythm - Sync to the Beat of Your life

MyRhythm is a routine and task management application that allows you to optimize your life to find your rhythm in a chaotic life. Create routines to drive healthy habit creation and decrease stress, save time, and help you find your flow.

### [GitHub Repository](https://github.com/tja2132/myrhythm)
### [Heroku Deployment](https://my-rhythm-d77c6a857e16.herokuapp.com/)

## Developers:

* Melissa Pothen   - mp4138
* Hannah Haldren   - hvh2105
* Tyler Andrews    - tja2132
* Nathan Coulibaly - nmc2169

## Functionality in Iter-1:

* View, Create, Update, and Delete Routines
* View, Create, Update, and Delete Tasks within routines
* Utilize nested resources for routine:task relation
* Minimal bootsrap UI 

## Functionality in Iter-2:

* New bootstrap UI with navbar and drastically improved routine visualization
* Weekly Calendar view - View your week of routines at a glance
* Routine sorting - Sort your routine list by name, recurrence, or start/end time
* Task re-ordering - Update task ordering in a routine using the up and down buttons
* Streamlined and improved routine creation form
* Database optimizations and improved seed data
* Initial steps towards tracking task completion statistics over time
* Reorganized feature directory - all user stories passing with 100% rspec coverage

## Functionality in demo & launch:

* User authentication
* Discover page where users can view, edit or copy public routines
* Public Routines - Control whether routines are shown on the discover page or private
* Daily Calendar View - View your routines for each day
* User Profile Page - Update your user information or set defaults for Insights and Calendar page
* Complete Routines! - Mark your routines complete when you finish them
* Insights Page - Keep track of your routine completions!
* Sort and Filter your Routines - Sort routines by total duration, Filter routines by Daily, Weekly, or No Recurrence
* Links on tasks - Keep track of items used for a task by adding links

### Quick Start
For initial install:
```sh 
rbenv install 3.2.2
rbenv global 3.2.2
# brew install postgresql
# or equivalent postgresql installation for your system
bundle install
rake db:setup
rails server
```

## Testing User Stories with Cucumber

```angular2html
cucumber features/*
```

See features/*.feature for user stories.

## Testing Code Coverage with RSpec
```
rspec

# results are generated in /coverage/.last_run.json and are visible
# by opening index.html in a web browser.
# rspec artifacts are not commited to the repository and must be run locally
```


### Development Setup
<details> 
<summary>Click to Expand</summary>

Rails Model Generation
```angular2html
rails generate cucumber:install
rails generate rspec:install
rails generate rspec:model routine
rails generate rspec:model task
```

Heroku Setup
```sh
#install heroku cli
curl https://cli-assets.heroku.com/install.sh | sh

#Create app
heroku apps:create myrhythm

#Change set for Ruby comptability
heroku stack:set heroku-20

#Make sure to push correct branch
git push heroku dev_main:main

#Create db
heroku addons:create heroku-postgresql

#Migrate data
heroku rake db:migrate
heroku rake db:seed

#Shutdown dynos
heroku ps:scale web=0
```

### Database Development
Create db migration:
```sh
rails g migration <Migration Name> <field_name>:<field-type>
rails db:migrate
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

Simple Calendar Setup

```angular2html
rails g simple_calendar:views
```

</details>


Reference Links:
* [RSpec templates](https://github.com/rspec/rspec-rails)
* [Cucumber Rails](https://github.com/cucumber/cucumber-rails)
* [DO - Rbenv Install](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)
* [DO - RoR App](https://www.digitalocean.com/community/tutorials/how-to-build-a-ruby-on-rails-application)
* [DO - RoR App with Nested Resources](https://www.digitalocean.com/community/tutorials/how-to-create-nested-resources-for-a-ruby-on-rails-application)
* [RoR Docs - Nested Resources](https://guides.rubyonrails.org/routing.html#nested-resources)
* [Simple Calendar](https://github.com/excid3/simple_calendar)
* [Devise](https://github.com/heartcombo/devise)
* [Chartkick](https://chartkick.com/)
* [Google charts - timeline](https://developers.google.com/chart/interactive/docs/gallery/timeline)