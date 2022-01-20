class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers, id: :uuid do |t|
      t.belongs_to :shelter, type: :uuid, foreign_key: true, index: {unique: true}

      t.string :name
      t.string :last_name
      t.string :email, null: false, index: {unique: true}
      t.string :password_digest, null: false
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
