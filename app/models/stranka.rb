class Stranka < ActiveRecord::Base
  belongs_to :posta
  has_many :racuns
  has_many :uporabniks, :through => :racuns
end
