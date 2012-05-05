class MakeIndexUnique < ActiveRecord::Migration
  def change
    remove_index :pets, [:remote_id, :provider]
    add_index :pets, [:provider, :remote_id], :unique => true
  end
end
