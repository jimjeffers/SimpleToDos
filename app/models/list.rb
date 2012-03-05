class List < ActiveRecord::Base
  # Relationships
  has_many :todos
  
  # Validations
  # validates_presence_of :name # hint: this one is a freebie
end
