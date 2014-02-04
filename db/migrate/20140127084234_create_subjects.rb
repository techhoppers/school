class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :division_id
      t.string :subject_name
      t.timestamps
    end
  end
end
