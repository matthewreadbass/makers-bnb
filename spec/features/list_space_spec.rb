require "space"

feature "user can list space" do
  scenario "user lists space" do
    visit("/list_space")
    fill_in "title", with: "Las Vegas"
    fill_in "description", with: "Renting my space"
    fill_in "price", with: 100
    fill_in "user_id", with: "47"
    click_button("Submit")
    expect(Space.all).to include({ :title => "Las Vegas", :description => "Renting my space", :price => "100", :user_id => "47" })
  end
end
