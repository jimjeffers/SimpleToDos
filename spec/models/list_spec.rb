require 'spec_helper'

describe List do
<<<<<<< HEAD
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
      @list.reload.incomplete_todos_count.should == 1
    end

    it "should have two todos if I add two items" do
      @list.todos << Factory.build(:todo)
      @list.todos << Factory.build(:todo)
      @list.reload.todos_count.should == 2
    end

    it "should have no todos if they are removed" do
      @list.todos << (todo_1=Factory.build(:todo))
      @list.todos << (todo_2=Factory.build(:todo))
      @list.reload
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
      @list.reload.incomplete_todos_count.should == 0
    end
  end

  describe "counting completed todos" do
    before(:each) do
      @list.todos << (@todo_1=Factory.build(:todo))
      @list.todos << (@todo_2=Factory.build(:todo))
      @todo_1.complete!
      @todo_2.complete!
    end

    
    it "should count two todos as completed" do
      @list.completed_todos_count.should == 2
    end

    #it "should only count one todo as completed if we mark one as incomplete" do
     # @todo_2.revert!
      #@list.completed_todos_count.should == 1
    #end

    it "should only count one todo as completed if we destroy a todo" do
      @todo_1.destroy
      @list.completed_todos_count.should == 1
    end

    it "should have no todos counted as incomplete if both are completed" do
      @list.incomplete_todos_count.should == 0
    end

    it "should have one todo marked as incomplete if one is reverted to incomplete" do
      @todo_2.revert!
      @list.incomplete_todos_count.should == 1
    end

  end
end
=======
  describe "counting todos" do
    before(:each) do
      @list = Factory(:list)
    end
    
    it "should have no todos if none have been added" do
      @list.todos_count.should == 0
    end
    
    # Hint:
    # Factory.build() is the same as Factory(), except with build(), the item
    # in question has not yet been saved.
    #
    # Factory(:todo)        == Todo.create     # => Todo.new.save
    # Factory.build(:todo)  == Todo.new
    #
    # More info: https://github.com/thoughtbot/factory_girl/wiki/Usage
    
    it "should update the count of todos when I add a todo" do
      @list.todos << Factory.build(:todo) # Append todo to list.
      @list.reload.todos_count.should_not == 0
    end
    
    pending "should have one todo counted as incomplete since this is the default state"
    
    it "should have two todos if I add two items" do
      @list.todos << Factory.build(:todo) # First todo
      @list.todos << Factory.build(:todo) # Second todo
      @list.reload
      @list.todos_count.should == 2
    end
    it "should habe no todos if I remove all of its items" do
      # Create two todos and add the to the list.
      @list.todos << (todo_1  = Factory.build(:todo))
      @list.todos << (todo_2 = Factory.build(:todo))
      @list.reload
      # Delete both of the newly created todos.
      todo_1.destroy
      todo_2.destroy
      # Ensure the count is 0.
      @list.todos_count.should == 0
      
      # Hint: See /app/models/todo.rb and look into the after_destroy hook.
    end
    
    pending "should have no todos counted as incomplete if they are destroyed"
  end
  
  describe "counting completed todos" do
    before(:each) do
      @list.todos << (@todo_1 = Factory(:todo))
      @list.todos << (@todo_2 = Factory(:todo))
      @todo_1.complete!
      @todo_2.complete!
    end
    
    # First spec is setup for you:
    
    # it "should count two todos as completed" do
    #   @list.completed_todos_count.should == 2
    # end
    
    pending "should only count one todo as completed if we mark one as incomplete"
    pending "should only count one todo as completed if we destroy a todo"
    pending "should have no todos counted as incomplete if both are completed"
    pending "should have one todo marked as incomplete if one is reverted to incomplete"
  end
  
end
>>>>>>> 25a619c6f4e4a4cfddbf75b0221f31e5e6370166
