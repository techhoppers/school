class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer :standard_id
      t.string :division_name
      t.timestamps
    end
  end
end
