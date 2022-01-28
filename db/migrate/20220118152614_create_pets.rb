class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_enum :specie, %w[dog cat]
    create_enum :gender, %w[male female]
    create_enum :age, %w[puppy young adult senior]
    create_enum :size, %w[small medium large extralarge]

    create_table :pets, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true

      t.enum :specie, enum_type: "specie", null: false
      t.string :name
      t.string :breed
      t.enum :gender, enum_type: "gender", null: false
      t.enum :age, enum_type: "age", null: false
      t.enum :size, enum_type: "size", null: false
      t.string :coat
      t.string :color
      t.boolean :special_needs, null: false, default: false
      t.text :description
      t.boolean :is_adopted, null: false, default: false

      t.timestamps
    end
  end
end
