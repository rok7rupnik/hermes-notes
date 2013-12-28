class CreateRacuns < ActiveRecord::Migration
  def change
    create_table :racuns do |t|
      t.date :datum
      t.float :znesek
      t.belongs_to :uporabnik, index: true
      t.belongs_to :stranka, index: true

      t.timestamps
    end
  end
end
