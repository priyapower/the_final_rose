class Bachelorette <ApplicationRecord
  has_many :contestants

  validates_presence_of :name
  validates_presence_of :season_number
  validates_presence_of :season_description
end
