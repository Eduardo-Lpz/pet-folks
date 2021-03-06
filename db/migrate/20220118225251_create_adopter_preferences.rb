class CreateAdopterPreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :adopter_preferences, id: :uuid do |t|
      t.belongs_to :adopter, type: :uuid, foreign_key: true

      t.enum :specie, enum_type: "specie", null: false
      t.string :breed
      t.enum :gender, enum_type: "gender", null: false
      t.enum :age, enum_type: "age", null: false
      t.enum :size, enum_type: "size", null: false
      t.boolean :special_needs, null: false, default: false

      t.timestamps
    end
  end
end
