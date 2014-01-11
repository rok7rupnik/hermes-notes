class AddRememberTokenToUporabniks < ActiveRecord::Migration
  def change
    add_column :uporabniks, :remember_token, :string
    add_index  :uporabniks, :remember_token
  end
end
