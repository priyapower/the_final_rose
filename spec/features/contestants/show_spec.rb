require "rails_helper"

RSpec.describe "Contestants Show Page", type: :feature do
  describe "As a visitor" do
    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Daniel", season_number: 3, season_description: "An amazing human that likes to give magic to all")
      @bachelorette_2 = Bachelorette.create!(name: "Drew", season_number: 1, season_description: "The best drawer of sting rays")
      @bachelorette_3 = Bachelorette.create!(name: "Corey", season_number: 7, season_description: "You Love To See It")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Leah", age: 21, hometown: "Denver")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Arique", age: 19, hometown: "San Antonio")
      @contestant_3 = @bachelorette_2.contestants.create!(name: "Saryn", age: 22, hometown: "Phoenix")
      @contestant_4 = @bachelorette_2.contestants.create!(name: "Judith", age: 20, hometown: "New York")
      @contestant_5 = @bachelorette_3.contestants.create!(name: "Dani", age: 23, hometown: "San Diego")
      @contestant_6 = @bachelorette_3.contestants.create!(name: "Angela", age: 20, hometown: "Baltimore")
      @outing_1 = Outing.create!(name: "Pie on the Pier", location: "San Diego Pier", date: "12/03/2007")
      @outing_2 = Outing.create!(name: "Sundaes on Sunday", location: "Baskin Robbins", date: "01/13/2007")

      @outing_1.contestant_outings.create!(contestant: @contestant_3)
      @outing_1.contestant_outings.create!(contestant: @contestant_4)
      @outing_2.contestant_outings.create!(contestant: @contestant_4)
    end

    it "can see contestants information" do
      visit "/contestants/#{@contestant_4.id}"
      save_and_open_page
      expect(page).to have_content(@contestant_4.name)
      expect(page).to have_content(@contestant_4.bachelorette.season_number)
      expect(page).to have_content(@contestant_4.bachelorette.season_description)
      expect(page).to have_content(@outing_1.name)
      expect(page).to have_link(@outing_1.name)
      expect(page).to have_content(@outing_2.name)
      expect(page).to have_link(@outing_2.name)
    end
  end
end
