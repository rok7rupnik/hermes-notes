#encoding: utf-8
class Uporabnik < ActiveRecord::Base
  belongs_to :posta
  has_many :storitevs
  has_many :racuns
  has_many :strankas, :through => :racuns
  has_many :stroseks

  attr_accessible :ime, :priimek, :nazivPodjetja, :naslov, :email, :telefon, :davcna, :trr, :ddv, :geslo, :posta_id, :geslo_confirmation


  # Validacije
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :email, :uniqueness => true, :format => EMAIL_REGEX
  validates :geslo, :length => { within: 5..40, messsage: " mora biti dolgo med 5 in 40 znakov." },
                    confirmation: { message: " se ne ujema z " }

  validates :ime, :priimek, :nazivPodjetja, :naslov, :posta_id, :email, :telefon, :davcna, :trr, :geslo, :geslo_confirmation, presence: { message: " je obvezno polje." };
  # TODO: Potrditev gesla še ne dela!



  # Kriptiranje gesla
  before_save do |variable|
    self.email = email.downcase
    encrypt_geslo
  end
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
