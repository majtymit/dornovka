class AddVisibilityCreatedAtIndexOnPosts < ActiveRecord::Migration
  def change
    add_index :posts, [:visibility, :created_at]
  end
end
