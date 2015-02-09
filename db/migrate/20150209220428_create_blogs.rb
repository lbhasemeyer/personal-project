class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :site
      t.integer :visit_id

      t.timestamps
    end
  end
end
