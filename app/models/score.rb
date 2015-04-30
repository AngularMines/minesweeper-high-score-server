class Score < ActiveRecord::Base
  belongs_to :user

  # def seconds(end_time, start_time)
  #   self.score = (Time.parse(end_time) - Time.parse(start_time)).to_i
  #   self.save
  # end

end
