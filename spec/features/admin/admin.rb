require 'rails_helper'

RSpec.describe Admin, type: :feature do
    AdminUser.create(email:"barsayam@gmail.com",password:"password")
    context "when the email and password is correct" do
        it "allows the admin to access the Active Admin dashboard" do
            visit admin_root_path
            fill_in "Email", with: "barsayam@gmail.com"
            fill_in "Password", with: "password"
            click_button "Login"
            expect(page).to have_content("Dashboard")
        end
    end

    context "when the email and password is incorrect" do
        it "not allows the user to access the Active Admin dashboard" do
            visit admin_root_path
            fill_in "Email", with: "sayambar@gmail.com"
            fill_in "Password", with: "password"
            click_button "Login"
            expect(page).to have_content("Invalid Email or password")
        end
    end

end
