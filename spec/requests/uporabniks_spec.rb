require 'spec_helper'

describe "Uporabniks" do

  before { @user = Uporabnik.new(ime: "Boštjan", priimek: "Rupnik", email: "info@laserstvomakuc.si") }

  subject { @user }

  it { should respond_to(:ime) }
  it { should respond_to(:priimek) }
  it { should respond_to(:email) }

end
