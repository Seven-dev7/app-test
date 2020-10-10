class CreateEmbassies < ActiveRecord::Migration[6.0]
  def change
    create_table :embassies do |t|
      t.string :in_country
      t.timestamps
    end
  end
end
