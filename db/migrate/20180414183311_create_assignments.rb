class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.text :course_code
      t.string :course_name
      t.integer :semister

      t.timestamps
    end
  end
end
