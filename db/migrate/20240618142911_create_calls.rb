class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.string :coach_id
      t.string :student_id
      t.datetime :start
      t.integer :satisfaction
      t.text :notes

      t.timestamps
    end
  end
end
