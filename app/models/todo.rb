class Todo < ActiveRecord::Base
<<<<<<< HEAD
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
    	event :revert do
    		transitions :to => :pending, :from => :completed
    	end
  	end

	def increment_list_count!
		unless list.nil?
      		list.update_attribute(:todos_count,list.todos.size + 1)
      	end
    end

    def decrement_list_count!
    	unless list.nil?
    		list.update_attribute(:todos_count,list.todos.size - 1)
    	end

	end
end
 
=======
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
>>>>>>> 25a619c6f4e4a4cfddbf75b0221f31e5e6370166
