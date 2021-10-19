
feature 'logging in to an existing account' do
  scenario 'user logs in ' do
    visit('/log_in_page')
    
    fill_in "email", with: "example@gmail.com"
    fill_in "password", with: "password"
    click_button("Submit")
    expect(page).to have_content("Welcome")
  end
end
feature 'sign up' do
  scenario 'user enters two correct passwords' do 
    visit('/')
    save_and_open_page
    fill_in('email', with: 'example@gmail.com')
    fill_in('password', with: '123')
    fill_in('password2', with: '123')
    click_button "Submit"
    expect(page).to have_content "You have created an account"
  end
  scenario ' user enters two different passwords' do
    visit('/')
    fill_in('email', with: 'example@gmail.com')
    fill_in('password', with: '123')
    fill_in('password2', with: '1234')
    click_button "Submit"
    expect(page).to have_content "Error, passwords do not match"
  end
end