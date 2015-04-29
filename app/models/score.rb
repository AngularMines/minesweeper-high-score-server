class Score < ActiveRecord::Base
  belongs_to :user

  def seconds(end_time, start_time)
    elapsed_seconds = (end_time - start_time).to_i
  end

end
