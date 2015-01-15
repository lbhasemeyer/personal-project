class CreateVisitsTable < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :user
      t.belongs_to :country

      t.timestamps
    end
  end
end
