class CreateTherapies < ActiveRecord::Migration
  def change
    create_table :therapies do |t|
      t.boolean :visibility
      t.integer :position
      t.string :title
      t.text :text
      t.attachment :picture1
      t.attachment :picture2
      t.attachment :picture3

      t.timestamps null: false
    end
  end
end
