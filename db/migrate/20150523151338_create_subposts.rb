class CreateSubposts < ActiveRecord::Migration
  def change
    create_table :subposts do |t|
      t.belongs_to :post

      t.text :text
      t.string :icon
      t.datetime :happened_at

      t.timestamps null: false
    end
  end
end