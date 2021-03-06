class CreateForeigners < ActiveRecord::Migration[6.0]
  def change
    create_table :foreigners do |t|
      t.string :country_name
      t.integer :year
      t.integer :number_of_french
      t.references :foreignable, polymorphic: true
    end
  end
end
