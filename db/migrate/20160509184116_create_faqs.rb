class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.boolean :visibility
      t.integer :position
      t.boolean :active
      t.string :title
      t.string :text

      t.timestamps null: false
    end
  end
end
