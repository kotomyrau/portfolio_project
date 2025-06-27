# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
start_time = Time.current

def seed_users(start_time)
  print "\nSeeding Users\t\tStart: #{Time.current - start_time}\n"
  require_relative './seeds/users_seed'
  UsersSeed.create_users
end

def seed_for_development(start_time)
  puts('-' * 100).to_s
  puts "Running Seeds"
  seed_users(start_time)
end

seed_for_development(start_time)
