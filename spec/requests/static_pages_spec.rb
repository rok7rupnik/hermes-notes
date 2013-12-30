#encoding: utf-8
require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { should have_content('Hermes-notes') }
    it { have_title(full_title("")) }
    it { should_not have_title('Domača stran | ') }
  end

  describe "Help page" do

    before { visit help_path }

    it { should have_content('Pomoč') }
    it { should have_title(full_title("Pomoč")) }
  end

  describe "About page" do

    before { visit about_path }

    it { should have_content('O nas') }
    it { should have_title(full_title("O nas")) }
  end

  describe "Contact page" do

    before { visit contact_path }

    it { should have_content('Kontakt') }
    it { should have_title(full_title("Kontakt")) }
  end
end
