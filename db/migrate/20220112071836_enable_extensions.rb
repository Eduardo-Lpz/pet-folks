class EnableExtensions < ActiveRecord::Migration[7.0]
  def change
    enable_extension "postgis"
    enable_extension "pgcrypto"
  end
end
