class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.references :user, null: false, foregin_key: true

      t.timestamps
    end
    add_index :lists, [:user_id, :created_at]
  end
end
