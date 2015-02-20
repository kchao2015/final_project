class Trip < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  belongs_to :season

  validates :name, presence: true
  validates :duration, presence: true
end
