class Todo < ActiveRecord::Base
  include AASM
  
  aasm do  # defaults to aasm_state
    state :pending, :initial => true
    state :completed
    
    event :complete do
      transitions :to => :completed, :from => :pending
    end
  end
  
end
