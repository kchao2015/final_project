class Item < ActiveRecord::Base
  belongs_to :category
  belongs_to :season

  has_many :packs
  has_many :trips, through: :packs
end
