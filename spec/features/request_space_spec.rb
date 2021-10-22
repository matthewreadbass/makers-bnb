feature "a user can view a request page for a specific space" do
  before(:each) do
    space = Space.add(title: "Las Vegas", description: "Renting my space", price: "100", available_from: "2021/10/19", available_to: "2021/10/26")

    visit("/spaces/#{space.id}")
  end

  scenario "when a user clicks on a space they want to request" do
    expect(page).to have_content("Las Vegas")
  end

  scenario "user can select a range of dates" do
    expect(page).to have_field("check_in")
    expect(page).to have_field("check_out")
  end

  scenario "when a user selects a range of dates" do
    fill_in "check_in", with: "2021/10/20"
    fill_in "check_out", with: "2021/10/22"
    click_button("Submit")
    expect(page).to have_content("Space request sent to the host")
  end
end
