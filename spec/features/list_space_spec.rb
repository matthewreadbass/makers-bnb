feature "user can list space" do
  scenario "user lists space" do
    visit("/list_space")
    fill_in "title", with: "Las Vegas"
    fill_in "description", with: "Renting my space"
    fill_in "price", with: 100
    fill_in "user_id", with: "47"
    click_button("Submit")
<<<<<<< HEAD
    expect(Space.all).to include({ :title => "Las Vegas", :description => "Renting my space", :price => "100", :user_id => "47" })
=======
    expect(page).to have_content "Las Vegas"
>>>>>>> f814131d1d878289c6ec52d442bb3b52c8adef5e
  end
end
