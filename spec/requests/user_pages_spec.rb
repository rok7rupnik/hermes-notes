require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "Prijava" do
    before { visit signup_path }

    it { should have_content('Prijava') }
    it { should have_title(full_title('Prijava')) }
  end
end
