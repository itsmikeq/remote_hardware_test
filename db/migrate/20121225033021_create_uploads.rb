class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :name, :unique => true
      t.integer :company_id

      t.timestamps
    end
  end
  add_index(:uploads, [ :name, :company_id ])

end
