class Doctorprofile < ApplicationRecord
  belongs_to :user
  validates :text, :user, presence: true
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :clinic_affiliation
  validates_presence_of :sub_specialty_english
  validates_presence_of :sub_specialty_spanish
end
