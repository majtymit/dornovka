class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :visibility
      t.string :title
      t.string :description
      t.text :text
      t.string :format
      t.string :featured
      t.string :category
      t.datetime :happened_at
      t.attachment :image

      t.timestamps null: false
    end
  end
end
