require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :season_number}
    it { should validate_presence_of :season_description}
  end

  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe "instance methods" do
    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Daniel", season_number: 3, season_description: "An amazing human that likes to give magic to all")
      @contestant_1 = @bachelorette_1.contestants.create!(name: "Leah", age: 19, hometown: "Denver")
      @contestant_2 = @bachelorette_1.contestants.create!(name: "Arique", age: 25, hometown: "San Antonio")
      @contestant_3 = @bachelorette_1.contestants.create!(name: "Saryn", age: 22, hometown: "Phoenix")
      @contestant_4 = @bachelorette_1.contestants.create!(name: "Judith", age: 20, hometown: "New York")
      @contestant_5 = @bachelorette_1.contestants.create!(name: "Dani", age: 23, hometown: "San Diego")
      @contestant_6 = @bachelorette_1.contestants.create!(name: "Angela", age: 20, hometown: "Baltimore")
    end
    it "#average_contestants_age" do
      expect(@bachelorette_1.average_contestants_age).to eq(21.5)
    end
  end
end
