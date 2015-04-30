class User < ActiveRecord::Base
  has_many :scores

  def self.create_score

  end
end
