class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.integer :year
      t.timestamps
    end
  end
end
