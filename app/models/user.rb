class User < ActiveRecord::Base
  has_many :stories, dependent: :destroy
  has_secure_password
  # Make sure passwords match when registering
  validates_confirmation_of :password
  attr_accessor :attribute1, :attribute2
end
