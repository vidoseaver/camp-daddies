require 'rails_helper'

RSpec.feature "user can add festivals" do
  it "adds user and fesitival and see's its main page" do
    visit festivals_path
    click_on "Add New Festival"
    fill_in "Name", with: "Festival One"
    fill_in "Location", with: "999 Newyork St, New York, NY, 00000"
    fill_in "Start_date", with: "1/1/2017"
    fill_in "End_date", with: "1/3/2017"

    click "Create Festival"

    expect(page).to have_content("Festival One")
    expect(page).to have_content("999 Newyork St, New York, NY, 00000")
    expect(page).to have_content("1/1/2017")
    expect(page).to have_content("1/3/2017")
  end
end
