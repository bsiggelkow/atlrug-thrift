class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.text :description
      t.datetime :due_by
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
