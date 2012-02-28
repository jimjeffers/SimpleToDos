class Todo < ActiveRecord::Base
  include AASM
  
  # Relationships:
  belongs_to :list
  
  # Callback hooks:
  after_create :increment_list_count!
  after_destroy :decrement_list_count!
  
  aasm do  # defaults to aasm_state
    state :pending, :initial => true
    state :completed
    
    event :complete do
      transitions :to => :completed, :from => :pending
    end
  end
  
  def increment_list_count!
    unless list.nil?
      list.update_attribute(:todos_count,list.todos.size+1)
    end
  end
  
  def decrement_list_count!
    
  end
  
end
