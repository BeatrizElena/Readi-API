# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'doctor_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Doctor.new
  t.first_name = row['first_name']
  t.last_name = row['last_name']
  t.clinic_affiliation = row['clinic_affiliation']
  t.sub_specialty_english = row['sub_specialty_english']
  t.sub_specialty_spanish = row['sub_specialty_spanish']
  t.phone_number = row['phone_number']
  t.save
  puts "Doctor: #{t.last_name}, #{t.first_name} saved!"
end
