class Racun < ActiveRecord::Base
  belongs_to :uporabnik
  belongs_to :stranka
  has_many :postavkas
  has_many :storitevs, :through => :postavkas
end
