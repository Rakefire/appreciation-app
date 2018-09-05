class CreateAppreciations < ActiveRecord::Migration[5.2]
  def change
    create_table :appreciations, id: :uuid do |t|
      t.string :name, null: false
      t.string :quality, null: false
      t.string :access_code
      t.text :note, null: false
      t.datetime :finalized_at
      t.datetime :read_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
