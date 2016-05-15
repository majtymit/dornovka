class CreateFigures < ActiveRecord::Migration
  def change
    create_table :figures do |t|
      t.boolean :visibility
      t.integer :position
      t.string :description
      t.string :link
      t.attachment :photo

      t.timestamps null: false
    end
  end
end
