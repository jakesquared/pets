class AddContactEmailToPets < ActiveRecord::Migration
  def change
    add_column :pets, :contact_email, :string
  end
end
