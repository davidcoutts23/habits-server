# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :habits
  validates :email, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }
end
