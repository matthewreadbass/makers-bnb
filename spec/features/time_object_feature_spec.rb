feature "creating new availability" do
  scenario "user creates new property and lists multiple available time periods" do
    visit("/log_in_page")
    fill_in "email", with: "example@gmail.com"
    fill_in "password", with: "password"
    click_button("Submit")
    visit("list_space")
    fill_in "title", with: "Big House"
    fill_in "description", with: "A very big house"
    fill_in "price", with: "250"
    click_button("Submit")
    visit("list_space")
    fill_in "title", with: "Small House"
    fill_in "description", with: "A tiny house"
    fill_in "price", with: "75"
    click_button("Submit")
    visit("/list_space")
    expect(Space.all).to have_content("Big House")
    expect(Space.all).to have_content("Small House")
    expect(Space.all).to have_content("A very big house")
    expect(Space.all).to have_content("A tiny house")
    expect(Space.all).to have_content("250")
    expect(Space.all).to have_content("75")
  end
end
