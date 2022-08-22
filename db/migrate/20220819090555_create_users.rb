class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.boolean :is_admin, default: false, null: false
      t.boolean :is_mover, default: false, null: false
      t.boolean :is_client, default: true, null: false

      t.timestamps
    end
  end
end
