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

doctors = [
  ['Elizabeth', 'Claus', 'f', Neuro-oncology', 'Low-Grade Glioma', 'Glioblastoma', 'Meningioma', 'Lymphoma, Primary CNS',
    %w['Gliomas' 'glial cells' 'astrocytes cells' 'oligodendrocytes cells' 'ependymal cells' 'Astrocytic tumors' 'astrocytomas' 'anaplastic astrocytomas' 'glioblastomas'
    'Oligodendroglial tumors' 'mixed gliomas' 'Meningiomas' 'schwannomas']],
  [ "Frankreich", 65447374 ],
  [ "Belgien", 10839905 ],
  [ "Niederlande", 16680000 ]
]

doctors.each do |profile|
  Doctors.create( :first_name => profile[0], :last_name => profile[1], :clinic => profile[3], :disease1 => profile[4], :disease2 => profile[5], :disease3 => profile[6])
end
