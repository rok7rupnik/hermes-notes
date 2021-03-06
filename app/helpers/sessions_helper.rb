module SessionsHelper
  def sign_in(uporabnik)
    remember_token = Uporabnik.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    uporabnik.update_attribute(:remember_token, Uporabnik.encrypt(remember_token))
    self.current_user = uporabnik
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = Uporabnik.encrypt(cookies[:remember_token])
    @current_user ||= Uporabnik.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  Uporabnik.encrypt(Uporabnik.new_remember_token))
    cookies.delete(:remember_token)
    session.delete(:return_to)
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to session[:return_to] || default, notice: "Pozdravljeni v aplikaciji Hermes-notes!"
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
