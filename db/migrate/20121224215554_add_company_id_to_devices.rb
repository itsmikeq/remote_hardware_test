class AddCompanyIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :company_id, :integer, :null => false, :default => 0
  end
end
