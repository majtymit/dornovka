class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.boolean :visibility
      t.integer :position
      t.string :date
      t.string :status
      t.string :icon
      t.string :description

      t.timestamps null: false
    end
  end
end
