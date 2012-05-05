class AddProviderToListingAndChangeIndex < ActiveRecord::Migration
  def change
    add_column :pets, :provider, :string
    remove_index :pets, :remote_id
    add_index :pets, [:remote_id, :provider]
  end
end
