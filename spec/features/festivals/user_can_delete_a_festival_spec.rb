require 'rails_helper'

RSpec.feature "user can delete a festival" do
  it "and get redireted to the index" do

    festival_one = Festival.create(name:"test 1", location: "test location 1", start_date:"2017-1-1", end_date: "2017-2-1", image_url:"www.google.com")

    visit festival_path(festival_one)
    save_and_open_page

    click_on "Delete"

    expect(page).to_not have_content("Festival One")
    expect(page).to_not have_content("999 Newyork St, New York, NY, 00000")
    expect(page).to_not have_content("2017-01-05")
    expect(page).to_not have_content("2017-03-05")
  end
end
