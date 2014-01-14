class AddAdminToUporabniks < ActiveRecord::Migration
  def change
    add_column :uporabniks, :admin, :boolean, default: false
  end
end
