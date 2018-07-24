class DoctorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :clinic_affiliation, :sub_specialty_english, :sub_specialty_spanish, :phone_number
end
