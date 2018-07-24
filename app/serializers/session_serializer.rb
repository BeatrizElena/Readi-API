class SessionSerializer < ActiveModel::Serializer
  attributes :id, :notes, :user_id, :doctor_id
  # has_one :user
  # has_one :doctor
end
