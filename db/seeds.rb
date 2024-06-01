# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Rails.root.glob('spec/support/**/*.rb').sort.each { |f| require f }

Type.destroy_all
Item.destroy_all

types = []

2.times do
  types << Fabricate(:type)
end

30.times do
  Fabricate(:item, type: types.sample)
end
