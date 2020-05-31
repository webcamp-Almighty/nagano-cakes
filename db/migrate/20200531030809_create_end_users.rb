class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string :last_name
      t.string :last_name
      t.string :last_name_kana
      t.string :last_name_kana
      t.string :email
      t.string :telephone_number
      t.string :encrypted_password
      t.string :postal_code
      t.string :address
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
