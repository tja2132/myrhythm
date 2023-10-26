# Development Setup Instructions


## Unix Setup (Development)

1. Clone this repository
2. Install rbenv by following the instructions at https://github.com/rbenv/rbenv
3. Install and set Ruby 3.0.6 as your global default

```angular2html
rbenv install 3.0.6
rbenv global 3.0.6
ruby --version
```

4. Install RubyMine from https://www.jetbrains.com/ruby/
4. Open this repository as a project in RubyMine
5. Navigate to RubyMine Settings -> Languages & Frameworks -> Ruby SDK and Gems

   i. Click the + icon, Select 'Interpreter', and navigate to your rbenv ruby installation

   ii. Default installation dir is .rbenv/versions/3.0.6/bin

8. Environment setup complete, see Quick Start

   i. If the db/rails commands fail saying the gem is not installed, simply click the "Run MyRhythm" triangle
   in the top right and then "resolve migrations" on the rails error page.

   
## Windows Setup (Development)

<details> 
<summary>Click to Expand (Is anyone else using this?)</summary>

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

</details>

## Database Development

### Connecting to the Database in RubyMine

1. Click the database cylinder on the far right toolbar in RubyMine
2. Click the + and choose Imported Data Sources
   
   i. If prompted, accept any recommended imports

   ii. Example URL: jdbc:sqlite:/Users/tyler/Documents/ESaaS/myrhythm/storage/development.sqlite3

3. Under development > main > tables you should now see the tables with live data. You can modify/add data here as
needed for development.

### Migrations

When creating new tables or updating existing tables, use db:reset to drop all existing tables before creating, 
migrating and seeding the new data.

See [this page](https://stackoverflow.com/a/10302357) for help with rake db commands.

```angular2html
rake db:reset
```

