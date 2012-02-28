class CreateLists < ActiveRecord::Migration
  def change
    # Create the list model's table.
    create_table :lists do |t|
      # Try to always specify blank defaults for better DB performance.
      # If not, NULL values slow down queries in our DB later.
      # NO_DEFAULTS == BAD_WEB_SCALEZ
      t.string  :name,                    :default => ""
      t.integer :completed_todos_count,   :default => 0
      t.integer :incompleted_todos_count, :default => 0
      t.integer :todos_count,             :default => 0
      t.timestamps
    end
    
    # Add a column on todos to reference the forieng key to the list
    # object.
    add_column :todos, :list_id, :integer, :default => 0
    
    # Always put indexes on attributes that you'd typically query with
    # such as foreign keys and cache counters.
    add_index :lists, :todos_count                # counter cache
    add_index :lists, :completed_todos_count      # counter cache
    add_index :lists, :incompleted_todos_count    # counter cache
    add_index :todos, :list_id                    # foreign key
  end
end