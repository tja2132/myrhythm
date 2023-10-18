# MyRhythm - Sync to the Beat of Your life

MyRhythm is a routine and task building application that allows you to find
your own rhythm in a chaotic life. Create routines, reminders, and habits that
decrease stress, save time, and help you find your flow.

### Ruby Info:
```
Ruby Version: 3.0.6
Rails Version: >= 7.1.1
```

## Quick Start:

```
bundle install
db create
db migrate
db seed
rails server
```

## Windows Setup (Development)

1. Clone this repository
2. Install Ruby 3.0.6 with DevKit from https://rubyinstaller.org/downloads/
   
   i. Direct Download Link: [Ruby+Devkit 3.0.6-1 (x64)](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.0.6-1/rubyinstaller-devkit-3.0.6-1-x64.exe)
   
   ii. Use all default installation parameters, make sure MSYS is also installed.
   
   iii. Default installation directory is C:\Ruby30-x64\bin\ruby.exe

3. Install RubyMine from https://www.jetbrains.com/ruby/
4. Open this repository as a project in RubyMine
5. Navigate to RubyMine Settings -> Languages & Frameworks -> Ruby SDK and Gems

   i. Click the + icon, Select 'Interpreter', and provide the path to ruby.exe from step 2

8. Environment setup complete, see Quick Start

## Unix Setup

1. Clone this repository
2. Install rbenv by following the instructions at https://github.com/rbenv/rbenv
3. Install and set Ruby 3.0.6 as your global default
```angular2html
rbenv install 3.0.6
rbenv global 3.0.6
ruby --version  (confirm 3.0.6)
```
4. Install RubyMine from https://www.jetbrains.com/ruby/
4. Open this repository as a project in RubyMine
5. Navigate to RubyMine Settings -> Languages & Frameworks -> Ruby SDK and Gems

   i. Click the + icon, Select 'Interpreter', and navigate to your rbenv ruby installation
  
   ii. Default installation dir is .rbenv/versions/3.0.6/bin

8. Environment setup complete, see Quick Start
   
   i. If the db/rails commands fail saying the gem is not installed, simply click the "Run MyRhythm" triangle
      in the top right and then "resolve migrations" on the rails error page.

## Testing user stories with Cucumber

### TODO