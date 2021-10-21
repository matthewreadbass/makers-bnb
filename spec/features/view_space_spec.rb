require "space"

feature "viewing spaces available" do
  scenario "spaces are viewed on the page" do
    visit("/list_space")

    fill_in "title", with: "Las Vegas"
    fill_in "description", with: "Renting my space"
    fill_in "price", with: 100
    fill_in "user_id", with: "721"
    click_button("Submit")
    visit("/spaces")
    expect(page).to have_content("Las Vegas")
  end
end
