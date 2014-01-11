class SessionsController < ApplicationController
  def create
    uporabnik = Uporabnik.find_by(email: params[:session][:email].downcase)
    if uporabnik && uporabnik.authenticate(params[:session][:password])
      sign_in uporabnik
      redirect_to uporabnik
    else
      redirect_to signin_path, notice: "Invalid email/password combination"

    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
