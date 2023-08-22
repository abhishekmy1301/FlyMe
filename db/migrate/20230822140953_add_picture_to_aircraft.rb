class AddPictureToAircraft < ActiveRecord::Migration[7.0]
  def change
    add_column :aircrafts, :picture_url, :string
  end
end
