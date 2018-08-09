class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name

      t.string :verification_token
      t.datetime :verified_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
