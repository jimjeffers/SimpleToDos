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
  
  describe "Adding todo" do
    before(:each) do
      @list = Factory(:list)
      visit list_path(@list)
    end
    
    it "should provide a form to add a new todo" do
      page.should have_css("form")
    end
    
    it "should not allow me add a todo without a name" do
      click_button "Add Todo"
      page.should have_css ("#errorExplanation")
    end
    
    it "should provide a confirmation that my todo was created" do
      fill_in "todo_name", :with => "My first Todo"
      click_button "Add Todo"
      save_and_open_page
      page.should have_content "Your todo was successfully created."
    end
  end
end