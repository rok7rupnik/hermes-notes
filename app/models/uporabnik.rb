#encoding: utf-8
class Uporabnik < ActiveRecord::Base
  belongs_to :posta
  has_many :storitevs
  has_many :racuns
  has_many :strankas, :through => :racuns
  has_many :stroseks

  attr_accessible :ime, :priimek, :nazivPodjetja, :naslov, :email, :telefon, :davcna, :trr, :ddv, :password, :posta_id, :password_confirmation

  has_secure_password

  # Validacije
  EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
  validates :email, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :length => { within: 5..40, messsage: " mora biti dolgo med 5 in 40 znakov." },
                    confirmation: { message: " se ne ujema z " }

  validates :ime, :priimek, :nazivPodjetja, :naslov, :posta_id, :email, :telefon, :davcna, :trr, :password, :password_confirmation, presence: { message: " je obvezno polje." };

  # TODO: Potrditev gesla še ne dela!



  # Kriptiranje gesla
  before_save do |variable|
    self.email = email.downcase
    encrypt_password
  end
  after_save :clear_geslo
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_digest= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  def clear_geslo
    self.password = nil
    self.password_digest = nil
  end


  # remember token
  before_create :create_remember_token

  def Uporabnik.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Uporabnik.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = Uporabnik.encrypt(Uporabnik.new_remember_token)
    end
end
