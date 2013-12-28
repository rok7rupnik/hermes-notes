class CreateStoritevs < ActiveRecord::Migration
  def change
    create_table :storitevs do |t|
      t.integer :skupnaKolicina
      t.float :cenaNaKos
      t.string :opis
      t.belongs_to :uporabnik, index: true

      t.timestamps
    end
  end
end
