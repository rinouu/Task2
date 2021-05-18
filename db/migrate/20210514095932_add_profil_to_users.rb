class AddProfilToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profil, :text
  end
end
