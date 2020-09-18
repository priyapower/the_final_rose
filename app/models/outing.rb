class Outing < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :date
end
