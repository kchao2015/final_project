class City < ActiveRecord::Base
  has_many :trips
  belongs_to :country

  validates :name, presence: true
end
