# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeding professions from data/professions.xml
path_to_professions = Rails.root.join('data', 'professions.xml')
doc = File.open(path_to_professions) { |f| Nokogiri::XML(f) }
array = Array.new
doc.xpath('//li').each do |node|
  profession = node.content
  if profession.include? '/'
    profession.split('/').each { |profession_part| Profession.create(name: profession_part.strip)}
  # profession.split('/').each { |profession_part| array << profession_part.strip}
  else
  Profession.create(name: profession.strip)
  # array << profession.strip
  end
end

 # puts array.count
 # puts array.uniq.count

 # Seeding users
 10.times do |index|
  User.create(full_name: "User#{index}", email: "user#{index}@mail.com", password: "user1234")
 end