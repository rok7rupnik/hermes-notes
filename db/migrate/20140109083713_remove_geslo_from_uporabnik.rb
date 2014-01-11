class RemoveGesloFromUporabnik < ActiveRecord::Migration
  def change
    remove_column :uporabniks, :geslo, :string
  end
end
