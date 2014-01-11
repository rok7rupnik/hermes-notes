class AddColumnToUporabnik < ActiveRecord::Migration
  def change
    add_column :uporabniks, :password_digest, :string
  end
end
