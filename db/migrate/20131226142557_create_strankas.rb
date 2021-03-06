class CreateStrankas < ActiveRecord::Migration
  def change
    create_table :strankas do |t|
      t.string :ime
      t.string :priimek
      t.string :nazivPodjetja
      t.string :naslov
      t.string :email
      t.string :telefon
      t.string :davcna
      t.string :trr
      t.boolean :ddv
      t.belongs_to :posta, index: true

      t.timestamps
    end
  end
end
