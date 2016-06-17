class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.boolean :visibility
      t.string :title
      t.string :description
      t.text :text
      t.string :format
      t.boolean :featured
      t.string :category
      t.datetime :happened_at
      t.integer :visits, default: 0

      t.timestamps null: false
    end
  end
end
