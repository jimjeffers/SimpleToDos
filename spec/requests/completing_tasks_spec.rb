require 'spec_helper'

describe "Completing Todos:" do
  before(:each) do
    @list = Factory(:list)
    @list.todos << (@todo_1 = Factory.build(:todo))
    @list.todos << (@todo_2 = Factory.build(:todo))
  end
  
  it "should not check the checkbox if the todo is pending" do
    visit list_path @list
    within("#todo_#{@todo_1.id}") do
      find("input[type='checkbox']").should_not be_checked
    end
  end
  
  it "should check a checkbox if the todo is completed" do
    @todo_1.complete!
    visit list_path @list
    within("#todo_#{@todo_1.id}") do
      find("input[type='checkbox']").should be_checked
    end
  end
end