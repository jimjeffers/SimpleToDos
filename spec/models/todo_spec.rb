require 'spec_helper'

describe Todo do
  it "should be pending when created" do
    todo = Factory(:todo)
    todo.pending?.should == true
  end
  
  it "should not be pending if completed" do
    todo = Factory(:todo)
    todo.complete!
    
    todo.pending?.should_not == true
  end
end
