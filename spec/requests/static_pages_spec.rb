require 'spec_helper'

describe "Static pages" do

  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do

    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', text: 'Sample App')
    end

    it "has the 'Home' title" do
      visit '/static_pages/home'
      page.should have_selector('title', 
      	text: "#{base_title} | Home")
    end
  end

  describe "Help page" do

  	it "has the content 'Help'" do
  	  visit '/static_pages/help'
      page.should have_selector('h1', text: 'Help')
  	end

  	it "has the 'Help' title" do
      visit '/static_pages/help'
      page.should have_selector('title', 
      	text: "#{base_title} | Help")
    end
  end

  describe "About Page" do

  	it "has the content 'About Us'" do
  	  visit '/static_pages/about'
      page.should have_selector('h1', text: 'About Us')
  	end

  	it "has the 'About Us' title" do
      visit '/static_pages/about'
      page.should have_selector('title', 
      	text: "#{base_title} | About Us")
    end
  end

  describe "Contact Page" do

  	it "has the heading 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', text: 'Contact')
    end

    it "has the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title',
       text: "#{base_title} | Contact")
    end
  end
end
