require 'rails_helper'

RSpec.feature "user can update festivals" do
  it "and festival and see it's changes" do

    festival_one = Festival.create(name:"test 1", location: "test location 1", start_date:"2017-1-1", end_date: "2017-2-1", image_url:"www.google.com")

    visit festival_path(festival_one)

    click_on "Edit/Update"

    fill_in "festival[name]", with: "Festival One"
    fill_in "festival[location]", with: "999 Newyork St, New York, NY, 00000"
    fill_in "festival[start_date]", with: "5/1/2017"
    fill_in "festival[end_date]", with: "5/3/2017"
    fill_in "festival[image_url]", with: "https://i.vimeocdn.com/portrait/58832_300x300"

    click_on "Update Festival"

    expect(page).to have_content("Festival One")
    expect(page).to have_content("999 Newyork St, New York, NY, 00000")
    expect(page).to have_content("2017-01-05")
    expect(page).to have_content("2017-03-05")
  end
end
