class ChangeReference < ActiveRecord::Migration
  def change
    change_column :capes, :reference, :string
  end
end
