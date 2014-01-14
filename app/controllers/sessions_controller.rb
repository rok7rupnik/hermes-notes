class SessionsController < ApplicationController
  def create
    uporabnik = Uporabnik.find_by(email: params[:session][:email].downcase)
    if uporabnik && uporabnik.authenticate(params[:session][:password])
      sign_in uporabnik
      redirect_back_or uporabnik
    else
      redirect_to signin_path, notice: "Napacni prijavni podatki!"

    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
