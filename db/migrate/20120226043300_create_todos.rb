class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name, :default => ""
      t.string :aasm_state, :default => "pending"

      t.timestamps
    end
  end
end
