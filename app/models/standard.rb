class Standard < ActiveRecord::Base
  validates :standard_name, :presence => true
end
