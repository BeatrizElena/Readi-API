class SessionSerializer < ActiveModel::Serializer
  attributes :id, :doctor_id, :notes, :date_time
  # has_one :user
  belongs_to :doctor
end
