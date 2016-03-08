class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :capes, :gryphon_pd_pm, :pd_pm
  end
end
