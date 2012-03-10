require 'spec_helper'

describe "Managing Lists:" do
  describe "Creating a list" do
    it "should have a form" do
      visit new_list_path
      page.should have_selector "form"
    end
    
    it "should tell me what I'm doing" do
      visit new_list_path
      page.should have_content "Create a new Todo List"
    end
    
    it "should not allow me to create a list if without a name" do
      visit new_list_path
      click_button "Create List"
      page.should have_css "#errorExplanation"
    end
    
    it "should display a confirmation that my list was created" do
      visit new_list_path
      fill_in "list_name", :with => "Simple List"
      click_button "Create List"
      page.should have_content "List successfully created."
    end
  end
  
  describe "Navigating between lists" do
    before(:each) do
      @list_1 = Factory(:list, :name => "First List")
      @list_2 = Factory(:list, :name => "Second List")
      visit lists_path
    end
    
    it "should display the first list" do
      page.should have_content @list_1.name
    end
    
    it "should display the second list" do
      page.should have_content @list_2.name
    end
    
    it "should display the contents of a list if we click on one" do
      @list_2.todos << Factory.build(:todo, :name => "The First Todo")
      click_link "Second List"
      page.should have_content "The First Todo"
    end
    
    it "should display a link that allows us to return to the lists page" do
      click_link "First List"
      page.should have_css "#return_to_lists"
    end
    
    it "should allow us to return to the lists page if we click the return to list link" do
      click_link "First List"
      click_link "return_to_lists"
      page.should have_css "#available_lists"
    end
  end
  
  describe "Adding todo" do
    before(:each) do
      @list = Factory(:list)
      visit list_path(@list)
    end
    
    it "should provide a link to add a new todo" do
      page.should have_css("a#new_todo")
    end
    
    it "should provide a form to add a new todo" do
      click_link "new_todo"
      page.should have_css("form")
    end
    
    it "should not allow me add a todo without a name" do
      click_link "new_todo"
      click_button "Add Todo"
      page.should have_css ("#errorExplanation")
    end
    
    it "should provide a confirmation that my todo was created" do
      click_link "new_todo"
      fill_in "todo_name", :with => "My first Todo"
      click_button "Add Todo"
      page.should have_content "Your todo was successfully created."
    end
    
    it "should show me all of the todos for the current list once I add my todo" do
      other_todo = Factory.build(:todo, :name => "My first todo (really)")
      @list.todos << other_todo
      click_link "new_todo"
      fill_in "todo_name", :with => "My first Todo"
      click_button "Add Todo"
      page.should have_content "My first todo (really)"
    end
  end
end