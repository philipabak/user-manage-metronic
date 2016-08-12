class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :name,     :null => true
      t.string :email,    :null => false
      t.string :password, :null => true
      t.string :phone, :null => false
      t.string :location, :null => false
      t.string :party_size, :null => true
      t.timestamps
    end

    add_index :users, :email,                :unique => true

  end
end
