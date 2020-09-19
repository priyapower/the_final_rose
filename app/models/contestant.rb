class Contestant <ApplicationRecord
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  belongs_to :bachelorette

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :hometown
end
