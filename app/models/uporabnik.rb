class Uporabnik < ActiveRecord::Base
  belongs_to :posta
  has_many :storitevs
  has_many :racuns
  has_many :strankas, :through => :racuns
  has_many :stroseks

  attr_accessible :geslo_confirmation, :geslo, :email
  # Prijava
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  #validates :geslo_confirmation, :presence => true, :on => :create
  validates :geslo, :presence => true,
                    :length => { :minimum => 5, :maximum => 40 },
                    :confirmation => true
  # TODO: Potrditev gesla še ne dela!

  # Kriptiranje gesla
  before_save :encrypt_geslo
  after_save :clear_geslo
  def encrypt_geslo
    if geslo.present?
      self.salt = BCrypt::Engine.generate_salt
      self.geslo= BCrypt::Engine.hash_secret(geslo, salt)
    end
  end
  def clear_geslo
    self.geslo = nil
  end

end
