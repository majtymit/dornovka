class CreateBlogpictures < ActiveRecord::Migration
  def change
    create_table :blogpictures do |t|
      t.attachment :picture
      t.belongs_to :post

      t.timestamps null: false
    end
  end
end
