feature "a user can view a request page for a specific space" do
  scenario "when a user clicks on a space they want to request" do
    space = Space.add(title: "Las Vegas", description: "Renting my space", price: "100", user_id: "12")

    visit("/spaces/#{space.id}")

    expect(page).to have_content("Las Vegas")
  end
end
