class CreateTherapies < ActiveRecord::Migration
  def change
    create_table :therapies do |t|
      t.boolean :visibility
      t.integer :position
      t.string :title
      t.text :description
      t.text :text
      t.attachment :picture1
      t.string :picture1desc
      t.attachment :picture2
      t.string :picture2desc
      t.attachment :picture3
      t.string :picture3desc

      t.timestamps null: false
    end
  end
end
