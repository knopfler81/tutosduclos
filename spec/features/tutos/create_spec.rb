require "spec_helper"
require "rails_helper"

context "Creating a tuto" do
  let!(:user){ User.create(first_name: "John", last_name: "Doe", email: "john@email.com", password:"password", password_confirmation:"password")
}
def create_tuto(options={})

  options[:title]    ||= "My tuto"
  options[:category] ||= "Ruby"
  options[:content]  ||= "This contains markdown language"

  visit "en/tutos"
  click_link I18n.t("search_form.create")
  expect(page).to  have_content("Create your tutorial")

  fill_in "Title",  with: options[:title]
  select("Ruby", from: "Chose a category")
  fill_in "Content", with: options[:content]
  click_button "Save"

end


it "redirect to the tuto list show page on success" do
  #create_tuto
  # expect(page).to have_content("Tuto was successfully created")
end

end


