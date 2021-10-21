require "space"

feature "user can list space" do
  scenario "user lists space" do
    visit("/list_space")
    fill_in "title", with: "Las Vegas"
    fill_in "description", with: "Renting my space"
    fill_in "price", with: 100
    fill_in "available_from", with: "2021/10/19"
    fill_in "available_to", with: "2021/10/26"
    click_button("Submit")

    expect(Space.all).to include({ :available_from => "2021-10-19", :available_to => "2021-10-26", :available => "t", :description => "Renting my space", :price => "100", :title => "Las Vegas" })
  end
end
