feature "a user can view a request page for a specific space" do
  before(:each) do
    visit("/list_space")
    fill_in "title", with: "Las Vegas"
    fill_in "description", with: "Renting my space"
    fill_in "price", with: 100
    fill_in "available_from", with: "2021/10/19"
    fill_in "available_to", with: "2021/10/26"
    click_button("Submit")
  end

  scenario "when a user clicks on a space they want to request" do
    click_link("Request")
    expect(page).to have_content("Las Vegas")
  end
end
