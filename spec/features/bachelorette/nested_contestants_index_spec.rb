require "rails_helper"

RSpec.describe "Bachelorette Nested Contestants Index Page", type: :feature do
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
      @contestant_7 = @bachelorette_3.contestants.create!(name: "Kiera", age: 22, hometown: "Baltimore")
      @contestant_8 = @bachelorette_3.contestants.create!(name: "Kiera", age: 22, hometown: "Philadelphia")
    end

    it "can see a link for contestants and go to the bachelorette specific contestants show page" do
      visit "/bachelorettes/#{@bachelorette_1.id}"
      expect(page).to have_link("This Bachelorette's Contestants")

      click_link("This Bachelorette's Contestants")
      expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")

      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_1.age)
      expect(page).to have_content(@contestant_1.hometown)
      expect(page).to have_content(@contestant_2.name)

      expect(page).to_not have_content(@contestant_3.name)

      expect(page).to have_link(@contestant_1.name)
    end

    it "can see links for contestant pages" do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"

      click_link(@contestant_1.name)
      expect(current_path).to eq("/contestants/#{@contestant_1.id}")
    end
    # 
    # it "can see unique hometowns of contestants" do
    #   visit "/bachelorettes/#{@bachelorette_3.id}/contestants"
    #   expect(page).to have_content("These contestants are from these hometowns: Baltimore and San Diego")
    # end

    it "can see unique hometowns of contestants" do
      visit "/bachelorettes/#{@bachelorette_3.id}/contestants"
      expect(page).to have_content("These contestants are from these hometowns: Baltimore, Philadelphia, and San Diego")
    end

  end
end
