class CreateDivisionTeachers < ActiveRecord::Migration
  def change
    create_table :division_teachers do |t|
      t.integer :user_id
      t.integer :division_id
      t.boolean :is_class_teacher
      t.timestamps
    end
  end
end
