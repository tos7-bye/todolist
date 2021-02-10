class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.references :user, foregin_key: true, null: false

      t.timestamps
    end
  end
end
