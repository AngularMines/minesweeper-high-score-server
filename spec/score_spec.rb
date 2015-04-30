require 'spec_helper'

describe Score do
  it "it should return the seconds of between two date objects" do
    end_time = '2015-04-30 11:26:40 +1200'
    start_time = '2015-04-30 11:26:27 +1200'
    @new_score = Score.new
    seconds = @new_score.seconds(end_time, start_time)
    expect(seconds).to eq(13)
  end
end
