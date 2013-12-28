class CreateStroseks < ActiveRecord::Migration
  def change
    create_table :stroseks do |t|
      t.date :datum
      t.float :znesek
      t.string :opis
      t.belongs_to :uporabnik, index: true

      t.timestamps
    end
  end
end
