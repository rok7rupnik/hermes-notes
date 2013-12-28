class Storitev < ActiveRecord::Base
  belongs_to :uporabnik
  has_many :postavkas
  has_many :racuns, :through => :postavkas
end
