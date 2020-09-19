require "rails_helper"

RSpec.describe "Bachelorette Show Page", type: :feature do
  describe "As a visitor" do
    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Daniel", season_number: 3, season_description: "An amazing human that likes to give magic to all")
      @bachelorette_2 = Bachelorette.create!(name: "Drew", season_number: 1, season_description: "The best drawer of sting rays")
      @bachelorette_3 = Bachelorette.create!(name: "Corey", season_number: 7, season_description: "You Love To See It")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Leah", age: 19, hometown: "Denver")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Arique", age: 25, hometown: "San Antonio")
      @contestant_3 = @bachelorette_2.contestants.create!(name: "Saryn", age: 22, hometown: "Phoenix")
      @contestant_4 = @bachelorette_2.contestants.create!(name: "Judith", age: 20, hometown: "New York")
      @contestant_5 = @bachelorette_3.contestants.create!(name: "Dani", age: 23, hometown: "San Diego")
      @contestant_6 = @bachelorette_3.contestants.create!(name: "Angela", age: 20, hometown: "Baltimore")
    end

    it "can see bachelorette specific information" do
      visit "/bachelorettes/#{@bachelorette_1.id}"

      expect(page).to have_content(@bachelorette_1.name)
      expect(page).to have_content(@bachelorette_1.season_number)
      expect(page).to have_content(@bachelorette_1.season_description)
    end

    it "can see average age of all the bachelorette contestants" do
      visit "/bachelorettes/#{@bachelorette_1.id}"
      expect(page).to have_content(@bachelorette_1.average_contestants_age)
    end

  end
end
