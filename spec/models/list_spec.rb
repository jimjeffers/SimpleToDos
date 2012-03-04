require 'spec_helper'

describe List do

  describe 'counting todos' do
    before(:each) do
      @list=Factory(:list)
    end

    it "should have no new tasks if none have been added" do
      @list.todos_count.should == 0
    end


    it "should create a new todo count when I add todos" do
      @list.todos << Factory.build(:todo)
      @list.reload.todos_count.should_not == 0
    end 
  
    it "should have one todo counted as incomplete since this is the default state" do
      @list.todos << @todo_1=Factory.build(:todo)
      @list.reload.pending_todos_count.should == 1
    end

    it "should have two todos if I add two items" do
      @list.todos << Factory.build(:todo)
      @list.todos << Factory.build(:todo)
      @list.reload.todos_count.should == 2
    end

    it "should have no todos if they are removed" do
      @list.todos << (todo_1=Factory.build(:todo))
      @list.todos << (todo_2=Factory.build(:todo))
      todo_1.destroy
      todo_2.destroy
      @list.reload.todos_count.should == 0
    end

    it "should have no todos counted as incomplete if they are destroyed" do
      @list.todos << (todo_1=Factory.build(:todo))
      @list.todos << (todo_2=Factory.build(:todo))
      @list.reload
      todo_1.destroy
      todo_2.destroy
      @list.reload.pending_todos_count.should == 0
    end
  end

  describe "counting completed todos" do
    before(:each) do
      @list=Factory(:list)
      @list.todos << (@todo_1=Factory.build(:todo))
      @list.todos << (@todo_2=Factory.build(:todo))
      @todo_1.complete!
      @todo_2.complete!
    end

    
    it "should count two todos as completed" do
      @list.reload
      @list.completed_todos_count.should == 2
    end

    it "should only count one todo as completed if we destroy a todo" do
      @list.reload
      @todo_1.destroy
      @list.reload
      @list.completed_todos_count.should == 1
    end

    it "should only count one todo in general if we destroy a todo" do
      @list.reload
      @todo_1.destroy
      @list.reload
      @list.todos_count.should == 1
    end

    it "should have no todos counted as incomplete if both are completed" do
      @list.pending_todos_count.should == 0
    end

    it "should have one todo marked as incomplete if one is reverted to incomplete" do
      @todo_2.revert!
      @list.reload
      @list.pending_todos_count.should == 1
    end

  end
end

