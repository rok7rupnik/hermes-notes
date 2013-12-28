class Postavka < ActiveRecord::Base
  belongs_to :racun
  belongs_to :storitev
end
