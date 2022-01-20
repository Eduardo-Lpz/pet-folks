class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")

    create_table :shelters, id: :uuid do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :address, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :link, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
