class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.text :description
      t.datetime :created
      t.datetime :completed
      t.integer :priority
      t.datetime :duedate
      t.boolean :closed

      t.timestamps
    end
  end
end
