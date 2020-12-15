require_relative './lib/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :migrations do
    # migrate both development and testing databases
    # rake db:migrate - migrating the development database
    # rake db:migrate SINATRA_ENV=test - migrate the testing database
    puts "Migrating Databases..."
    system "rake db:migrate && rake db:migrate SINATRA_ENV=test"
end

task :drop do
    puts "Dropping databases...."
    system "rm ./db/books.db && rm ./db/schema.rb"
end

task :reset_db do
    # drop all the databases and re-migrate them and start the server
    Rake::Task[:drop].execute
    Rake::Task[:migrations].execute
end