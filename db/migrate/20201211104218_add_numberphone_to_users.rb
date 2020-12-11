class AddNumberphoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :contact_phone, :string
    add_index :users, :contact_phone, unique: true
    #rename contact column
    rename_column :users, :contact, :contact_whatsapp
  end
end
