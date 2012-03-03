require 'spec_helper'

describe Todo do
<<<<<<< HEAD
  it "should be incomplete when created" do
    todo=Factory(:todo)
    todo.pending?.should == true
  end
  it "should not be completed if reverted" do
  	todo=Factory(:todo)
    todo.complete!
    todo.revert!
    todo.complete?.should == false
  end
  it "should not be pending if completed" do
  	todo=Factory(:todo)
  	todo.complete!
  	todo.pending?.should == false
  end
end


=======
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
>>>>>>> 25a619c6f4e4a4cfddbf75b0221f31e5e6370166
