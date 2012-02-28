class List < ActiveRecord::Base
  # To see how counter cache works see:
  # http://railscasts.com/episodes/23-counter-cache-column
  has_many :todos
end
