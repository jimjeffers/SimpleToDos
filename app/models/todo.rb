class Todo < ActiveRecord::Base

 	include AASM
  
 	# Relationships:
 	belongs_to :list
  
	# Callback hooks:
 	after_create :increment_list_count!
 	after_destroy :decrement_list_count!

  #Scopes
  scope :pending, where("aasm_state='pending'")
  
 	aasm do  # defaults to aasm_state
		state :pending, :initial => true, :enter => :increment_pending_count!, :exit => :decrement_pending_count!
    state :completed, :enter => :increment_completed_count!, :exit => :decrement_completed_count!
    
    	event :complete do
      	transitions :to => :completed, :from => :pending
    	end	

    	event :revert do
    		transitions :to => :pending, :from => :completed
    	end
  	end

	def increment_list_count!
    List.find(list_id).update_attribute(:todos_count,List.find(list_id).todos_count + 1) unless list.nil?
    increment_pending_count! if pending?
    increment_completed_count! if completed?
  end

  def decrement_list_count!
    List.find(list_id).update_attribute(:todos_count,List.find(list_id).todos_count - 1) unless list.nil?
    decrement_pending_count! if pending? 
    decrement_completed_count! if completed?
	end

  def increment_pending_count!
    List.find(list_id).update_attribute(:pending_todos_count, List.find(list_id).pending_todos_count + 1) unless list.nil?
  end

  def decrement_pending_count!
    List.find(list_id).update_attribute(:pending_todos_count, List.find(list_id).pending_todos_count - 1) unless list.nil?
  end

  def increment_completed_count!
    List.find(list_id).update_attribute(:completed_todos_count, List.find(list_id).completed_todos_count + 1) unless list.nil?
  end

  def decrement_completed_count!
    List.find(list_id).update_attribute(:completed_todos_count, List.find(list_id).completed_todos_count - 1) unless list.nil?
  end

end
