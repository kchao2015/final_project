class Season < ActiveRecord::Base
  has_many :trips
  has_many :items
end
