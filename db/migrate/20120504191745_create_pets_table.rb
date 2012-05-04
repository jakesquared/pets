class CreatePetsTable < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :species
      t.string :gender
      t.string :photo
      t.string :zip
      t.string :size
      t.string :age
      t.text   :description
      t.string :status
      t.string :kill_date
      t.string :kill_reason
      t.integer :remote_id
      t.string :click_url
    end
    add_index :pets, :remote_id, :unique => true
  end
end
