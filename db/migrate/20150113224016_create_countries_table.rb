class CreateCountriesTable < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :region
      t.string :code

      t.timestamps
    end
  end
end
