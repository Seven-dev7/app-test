class CreateEmbassies < ActiveRecord::Migration[6.0]
  def change
    create_table :embassies do |t|
      t.string :in_country
      t.float :latitude
      t.float :longitude
      t.float :gps
      t.timestamps
    end
  end
end
