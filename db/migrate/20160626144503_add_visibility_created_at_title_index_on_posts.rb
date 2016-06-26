class AddVisibilityCreatedAtTitleIndexOnPosts < ActiveRecord::Migration
  def change
    add_index :posts, [:visibility, :created_at, :title]
  end
end
