class CreateCapes < ActiveRecord::Migration
  def change
    create_table :capes do |t|
      t.string :project_name
      t.string :contract_title
      t.string :capes_tags
      t.text :project_description
      t.string :gryphon_pd_pm
      t.string :prime_sub
      t.string :client
      t.string :end_client
      t.string :client_poc_address
      t.string :client_poc_name_contact
      t.string :reference
      t.string :contract_number
      t.string :contract_value
      t.string :period_of_performance
      t.string :notes

      t.timestamps null: false
    end
  end
end
