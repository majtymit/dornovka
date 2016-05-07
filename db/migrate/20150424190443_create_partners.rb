class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :visibility
      t.integer :position
      t.string :name
      t.string :description
      t.string :contact
      t.string :link
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
