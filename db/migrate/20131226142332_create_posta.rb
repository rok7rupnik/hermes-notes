class CreatePosta < ActiveRecord::Migration
  def change
    create_table :posta do |t|
      t.integer :postnaSt
      t.string :naziv

      t.timestamps
    end
  end
end
