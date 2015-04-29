class Score < ActiveRecord::Base

  def seconds(end_time, start_time)
    elapsed_seconds = ((end_time - start_time) * 24 * 60 * 60).to_i
  end


end
