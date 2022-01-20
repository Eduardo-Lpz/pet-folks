class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :last_name
      t.string :email, null: false, index: {unique: true}
      t.string :password_digest, null: false
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
