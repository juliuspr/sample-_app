require 'spec_helper'

describe UsersHelper do
	describe "gravatar_for" do
		it "should take in size parameter" do
			# implement
			gravatar_for(FactoryGirl.create(:user), size: 40).should =~ /s=40/
		end
	end
end