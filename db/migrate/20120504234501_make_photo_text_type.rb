class MakePhotoTextType < ActiveRecord::Migration
  def change
    change_column :pets, :photo, :text
  end
end
