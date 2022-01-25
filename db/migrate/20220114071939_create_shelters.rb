class CreateShelters < ActiveRecord::Migration[7.0]
  def change
    create_table :shelters, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.string :address, default: "", null: false
      t.st_point :lonlat, geographic: true
      t.string :phone, null: false
      t.string :link, default: ""
      t.text :description, default: ""

      t.boolean :is_rescuer, default: false, null: false

      t.timestamps
    end
  end
end
