class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.boolean :is_admin
      t.boolean :is_mover
      t.boolean :is_client

      t.timestamps
    end
  end
end
