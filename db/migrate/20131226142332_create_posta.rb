class CreatePosta < ActiveRecord::Migration
  def change
    create_table :posta do |t|
      t.integer :postnaSt
      t.string :naziv

      t.timestamps

      execute "INSERT INTO posta (postnaSt, naziv) VALUES
              (1000, 'Ljubljana')
              "
    end
  end
end
