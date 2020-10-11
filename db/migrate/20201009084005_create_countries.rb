class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.integer :code
      t.string :alpha_2
      t.string :alpha_3
      t.string :name_fr
      t.string :name_en
      t.timestamps
    end
  end
end
