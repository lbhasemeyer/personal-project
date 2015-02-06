class AddBlogAdvicePhotoColumnsToVisitsTable < ActiveRecord::Migration
  def change
    add_column :visits, :blog, :string
    add_column :visits, :advice, :string
    add_column :visits, :photo, :string
  end
end
