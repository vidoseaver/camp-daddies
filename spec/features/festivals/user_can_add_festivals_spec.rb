require 'rails_helper'

RSpec.feature "user can add festivals" do
  it "and festival and see's its main page" do

    visit new_festival_path

    save_and_open_page

    fill_in "Name", with: "Festival One"
    fill_in "Location", with: "999 Newyork St, New York, NY, 00000"
    fill_in "festival[start_date]", with: "1/1/2017"
    fill_in "festival[end_date]", with: "1/3/2017"
    fill_in "festival[image_url]", with: "https://i.vimeocdn.com/portrait/58832_300x300"

    click_on "Create Festival"

    expect(page).to have_content("Festival One")
    expect(page).to have_content("999 Newyork St, New York, NY, 00000")
    expect(page).to have_content("2017-01-01")
    expect(page).to have_content("2017-03-01")
  end
end
