# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#

require 'faker'

10_000.times do
  Job.insert_all(
    [
      title: Faker::Job.title,
      company: Faker::Company.name,
      country: %w[Canada UK Germany Netherlands Poland Portugal Germany].sample,
      stack: %w[ruby go python].sample,
      remote_policy: %w[Remote Hybrid On-site].sample,
      published_at: Faker::Date.between(from: 1.year.ago, to: Date.today)
    ]
  )
end
