class CreateRescuers < ActiveRecord::Migration[7.0]
  def change
    create_table :rescuers, id: :uuid do |t|
      t.string :name, null: false, default: ""
      t.string :address, default: "", null: false
      t.st_point :lonlat, geographic: true
      t.string :phone, null: false

      t.timestamps
    end
  end
end
