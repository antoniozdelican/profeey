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
# array = Array.new
doc.xpath('//li').each do |node|
  profession = node.content
  if profession.include? '/'
    profession.split('/').each { |profession_part| Profession.create(name: profession_part)}
  # profession.split('/').each { |profession_part| array << profession_part}
  else
  Profession.create(name: profession)
  # array << profession
  end
end

# puts array.count
# puts array.uniq.count