feature "user can list space" do
  scenario "user lists space" do
    visit("/list_space")
    fill_in "title", with: "Las Vegas"
    fill_in "description", with: "Renting my space"
    fill_in "price", with: "100"
    click_button("Submit")
    expect(Space.all).to have_content("Las Vegas")
    expect(Space.all).to have_content("Renting my space")
    expect(Space.all).to have_content("100")
  end
end
