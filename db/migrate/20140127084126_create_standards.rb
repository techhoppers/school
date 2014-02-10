class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.integer :academic_id
      t.string :standard_name
      t.timestamps
    end
  end
end
