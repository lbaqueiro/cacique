require 'spec_helper'

describe Project do
  before(:each) do
     user     = mock(:user)
     user.should_receive(:to_i).any_number_of_times.and_return(1) #The message can be received 0 or more times.
     @project = Factory(:project, :user_id=>user)
  end

  it "should create a new instance given valid attributes" do
      @project.save.should be_true
  end

end