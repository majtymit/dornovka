class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :visibility
      t.integer :position
      t.string :active
      t.string :title
      t.string :text

      t.timestamps null: false
    end
  end
end
