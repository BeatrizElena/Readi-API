class SessionSerializer < ActiveModel::Serializer
  attributes :id, :notes, :date_time
  has_one :user
  has_one :doctor
end
