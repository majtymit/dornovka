class CreateSendMails < ActiveRecord::Migration
  def change
    create_table :send_mails do |t|
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps null: false
    end
  end
end
