class Pack < ActiveRecord::Base
  belongs_to :trip
  belongs_to :item
end
