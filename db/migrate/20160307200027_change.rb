class Change < ActiveRecord::Migration
  def change
    change_column :capes, :capes_tags, :string
  end
end
