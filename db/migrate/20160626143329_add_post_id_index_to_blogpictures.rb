class AddPostIdIndexToBlogpictures < ActiveRecord::Migration
  def change
    add_index :blogpictures, :post_id
  end
end
