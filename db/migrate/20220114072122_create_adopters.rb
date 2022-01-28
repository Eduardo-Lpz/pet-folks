class CreateAdopters < ActiveRecord::Migration[7.0]
  def change
    create_table :adopters, id: :uuid do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.st_point :lonlat, geographic: true
      t.string :phone

      t.timestamps
    end
  end
end
