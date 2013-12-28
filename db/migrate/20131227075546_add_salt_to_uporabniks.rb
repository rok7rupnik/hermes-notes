class AddSaltToUporabniks < ActiveRecord::Migration
  def change
    add_column :uporabniks, :salt, :string
  end
end
