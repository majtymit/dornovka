class AddVisibilityIndexOnPosts < ActiveRecord::Migration
  def change
    add_index :posts, :visibility
  end
end
