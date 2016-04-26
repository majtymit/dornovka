class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :text
      t.integer :visits
      t.string :image_url
      t.string :format
      t.belongs_to :category
      t.datetime :happened_at
      t.text :date

      t.timestamps null: false
    end
  end
end
