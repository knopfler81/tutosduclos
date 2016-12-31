require "spec_helper"
require "rails_helper"

context "Logging In" do

  let!(:user){ User.create(first_name: "John", last_name: "Doe", email: "john@email.com", password:"password", password_confirmation:"password")
}
  it "logs the user in" do
    visit "/en/users/login"
    fill_in "user_email", with: "john@email.com"
    fill_in "user_password", with: "password"
    click_button "Sign in"
  end
end