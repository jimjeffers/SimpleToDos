require 'spec_helper'

describe Todo do

  it "should be incomplete when created" do
    todo=Factory(:todo)
    todo.pending?.should == true
  end
  it "should not be completed if reverted" do
  	todo=Factory(:todo)
    todo.complete!
    todo.revert!
    todo.completed?.should == false
  end
  it "should not be pending if completed" do
  	todo=Factory(:todo)
  	todo.complete!
  	todo.pending?.should == false
  end
end


