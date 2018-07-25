# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :session
  has_many :doctors, through: :sessions
end
