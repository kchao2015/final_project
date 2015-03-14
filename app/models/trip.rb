class Trip < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  belongs_to :season

  has_many :packs
  has_many :items, through: :packs

  validates :name, presence: true
  validates :duration, presence: true
end
