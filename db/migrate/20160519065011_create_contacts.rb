class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.boolean :answered, default: false
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
