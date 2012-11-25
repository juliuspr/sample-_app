require 'spec_helper'

describe "User Pages" do

	subject { page }

  describe "signup page" do
  	before { visit signup_path }

    it { should have_selector('h1', text: 'Sign Up') }
    it { should have_selector('title', text: full_title('Sign Up'))  }
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_selector('h1', text: user.name) }
  	it { should have_selector('title', text: user.name) }
  end

  describe "signup" do

  	before { visit signup_path }
  	let(:submit) { "Create my account" }

  	describe "signup with invalid information" do
  		it "should not create new user" do
  			expect { click_button submit }.not_to change(User, :count)
  		end

  		describe "display error messages" do
  			before { click_button submit }
  			
  			it { should have_selector('h1', text: "Sign Up")}
  			it { should have_selector("li", text: "Email is invalid") }
  			
  		end
  	end

  	describe "signup with valid information" do
  		before do
  			#fill in the form
  			fill_in "Name", with: "Example User"
  			fill_in "Email", with: "example@tmail.com"
  			fill_in "Password", with: "foobar"
  			fill_in "Confirmation", with: "foobar"
  		end

  		it "should create a new user" do
  			expect { click_button submit }.to change(User, :count).by(1)
  		end

  		describe "after saving the user" do
  			before { click_button submit }
  			
  			it { should have_selector('h1', text: "Example User") }
  			it { should have_selector('.alert-success', text: "Welcome to the Sample App!") }
        it { should have_link('Sign out') }
  		end

  	end

  end

end
