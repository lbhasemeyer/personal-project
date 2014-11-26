class Rename < ActiveRecord::Migration
  def change
    rename_column :users, :profile_picture, :avatar
  end
end
