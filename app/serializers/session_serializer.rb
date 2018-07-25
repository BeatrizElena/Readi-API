class SessionSerializer < ActiveModel::Serializer
  attributes :id, :doctor_id, :notes
  # has_one :user
  belongs_to :doctor
end
