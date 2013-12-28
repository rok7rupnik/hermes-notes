class CreatePostavkas < ActiveRecord::Migration
  def change
    create_table :postavkas do |t|
      t.integer :zaporednaSt
      t.integer :kolicina
      t.float :popust
      t.belongs_to :racun, index: true
      t.belongs_to :storitev, index: true

      t.timestamps
    end
  end
end
