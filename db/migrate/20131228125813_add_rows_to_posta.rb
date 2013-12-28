#encoding: utf-8
class AddRowsToPosta < ActiveRecord::Migration
  def self.up
    execute "INSERT INTO posta (postnast, naziv) VALUES
              (1000, 'Ljubljana'),
              (1001, 'Ljubljana - poštni predali')"
  end

  def self.down
    execute "DELETE FROM posta WHERE postnaSt > 999"
  end
end
