class CreateStudentDivisions < ActiveRecord::Migration
  def change
    create_table :student_divisions do |t|
      t.integer :student_id
      t.integer :division_id
      t.timestamps
    end
  end
end
