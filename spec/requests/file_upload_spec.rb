require "spec_helper"

describe "file upload" do
	include Warden::Test::Helpers 

	it "can upload a supported file" do
		user = FactoryGirl.create(:user)
		login_as user
		visit importer_path
		attach_file "tab_file", "#{Rails.root}/example_input.tab"
		click_button "Import!"

		page.should have_content("Your import is complete.")
		page.should have_content("$95.00")
		page.should have_content("4")
		page.should have_content("0")
	end

	it "can handle improper file upload" do
		user = FactoryGirl.create(:user)
		login_as user
		visit importer_path
		attach_file "tab_file", "#{Rails.root}/README.rdoc" #an invalid file
		click_button "Import!"

		page.should have_content("Error")
	end
end