require 'spec_helper'

describe "static_pages/home.html.erb" do
  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("Hermes-notes")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('Domača stran | ')
    end
  end
end
