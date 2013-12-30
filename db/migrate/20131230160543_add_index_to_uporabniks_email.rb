class AddIndexToUporabniksEmail < ActiveRecord::Migration
  def change
  	add_index :uporabniks, :email, unique: true
  end
end
