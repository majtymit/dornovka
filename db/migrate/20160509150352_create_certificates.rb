class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :visibility
      t.integer :position
      t.string :title
      t.string :description
      t.attachment :image

      t.timestamps null: false
    end
  end
end
