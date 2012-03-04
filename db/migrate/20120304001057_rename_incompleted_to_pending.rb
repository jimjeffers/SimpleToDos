class RenameIncompletedToPending < ActiveRecord::Migration
  def up
	rename_column :lists, :incompleted_todos_count, :pending_todos_count
  end

  def down
	rename_column :lists, :pending_todos_count, :incompleted_todos_count

  end
end
