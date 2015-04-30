class User < ActiveRecord::Base
  has_many :scores
  validates :username, uniqueness: true
end
