RSpec.describe "User edits a weather day" do

  before :each do
    @weather_date = BikeDate.create("2017-04-19")
    @weather_day = Weather.create(date: @weather_date.id, max_temp: 85.0, mean_temp: 83.0, min_temp: 81.0, mean_humidity: 77.0, mean_visibility: 7.0, mean_wind: 12.0, precipitation: 1.0)
  end

  it "can update a weather day from /weather"
    visit "/conditions"

    click_link("Edit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}/edit")

    fill_in "weather[name]", with: "2017-04-18"
    fill_in "weather[max_temp]", with: 75.0
    fill_in "weather[min_temp]", with: 71.0
    fill_in "weather[mean_temp]", with: 73.0
    fill_in "weather[mean_humidity]", with: 62.0
    fill_in "weather[mean_visibility]", with: 8.0
    fill_in "weather[mean_wind]", with: 5.0
    fill_in "weather[precipitation]", with: 0.0

    click_button("Submit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}")
    expect(page).to have_content("April 18, 2017")
  end

  it "can update a weather day from '/conditions/#{@weather_day.id}/edit'"
    visit '/conditions/#{@weather_day.id}/edit'

    fill_in "weather[name]", with: "2017-04-18"
    fill_in "weather[max_temp]", with: 75.0
    fill_in "weather[min_temp]", with: 71.0
    fill_in "weather[mean_temp]", with: 73.0
    fill_in "weather[mean_humidity]", with: 62.0
    fill_in "weather[mean_visibility]", with: 8.0
    fill_in "weather[mean_wind]", with: 5.0
    fill_in "weather[precipitation]", with: 0.0

    click_button("Submit")

    expect(current_path).to eq("/conditions/#{@weather_day.id}")
    expect(page).to have_content("April 18, 2017")
  end

end